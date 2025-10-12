using System;
using System.Collections.Generic;
using UnityEngine;

namespace RiiSports.Input
{
    /// <summary>
    /// Detects motion gestures from DSU motion data for Wii Sports-style interactions
    /// </summary>
    public class MotionGestureDetector : MonoBehaviour
    {
        [Header("Gesture Detection Settings")]
        [SerializeField] private float swingThreshold = 2.0f;
        [SerializeField] private float shakeThreshold = 3.0f;
        [SerializeField] private float gestureTimeout = 0.5f;
        [SerializeField] private int motionHistorySize = 10;
        [SerializeField] private bool debugGestures = false;
        
        [Header("Bowling Specific")]
        [SerializeField] private float bowlingSwingMinVelocity = 1.5f;
        [SerializeField] private float bowlingSwingMaxAngle = 45f;
        
        // Events
        public event Action<MotionGestureEvent> OnGestureDetected;
        public event Action<Vector3, float> OnBowlingSwingDetected;
        
        // Motion history for gesture detection
        private Queue<DSUMotionData> motionHistory = new Queue<DSUMotionData>();
        private DSUMotionData lastMotionData;
        private float lastGestureTime = 0f;
        
        // Gesture state tracking
        private bool isInSwingMotion = false;
        private Vector3 swingStartAccel = Vector3.zero;
        private float swingStartTime = 0f;
        
        private void Start()
        {
            // Initialize motion history
            for (int i = 0; i < motionHistorySize; i++)
            {
                motionHistory.Enqueue(DSUMotionData.Empty);
            }
        }
        
        public void ProcessMotionData(DSUMotionData motionData)
        {
            if (!motionData.isConnected) return;
            
            // Add to history
            if (motionHistory.Count >= motionHistorySize)
                motionHistory.Dequeue();
            motionHistory.Enqueue(motionData);
            
            // Detect gestures
            DetectSwingGesture(motionData);
            DetectShakeGesture(motionData);
            DetectBowlingSwing(motionData);
            
            lastMotionData = motionData;
        }
        
        private void DetectSwingGesture(DSUMotionData currentData)
        {
            if (Time.time - lastGestureTime < gestureTimeout) return;
            
            Vector3 currentAccel = currentData.accelerometer;
            Vector3 currentGyro = currentData.gyroscope;
            
            // Calculate acceleration magnitude
            float accelMagnitude = currentAccel.magnitude;
            float gyroMagnitude = currentGyro.magnitude;
            
            // Detect swing start (sudden acceleration)
            if (!isInSwingMotion && accelMagnitude > swingThreshold)
            {
                isInSwingMotion = true;
                swingStartAccel = currentAccel;
                swingStartTime = Time.time;
                
                if (debugGestures)
                    Debug.Log($"Swing motion started - Accel: {accelMagnitude:F2}");
            }
            
            // Detect swing completion (deceleration after acceleration)
            if (isInSwingMotion && Time.time - swingStartTime > 0.1f)
            {
                if (accelMagnitude < swingThreshold * 0.5f || Time.time - swingStartTime > 1.0f)
                {
                    // Swing completed
                    Vector3 swingDirection = (currentAccel - swingStartAccel).normalized;
                    float swingIntensity = Mathf.Clamp01((swingStartAccel.magnitude - swingThreshold) / swingThreshold);
                    
                    MotionGesture gestureType = DetermineSwingDirection(swingDirection);
                    
                    MotionGestureEvent gestureEvent = new MotionGestureEvent(
                        gestureType,
                        swingIntensity,
                        swingDirection,
                        Time.time
                    );
                    
                    OnGestureDetected?.Invoke(gestureEvent);
                    lastGestureTime = Time.time;
                    isInSwingMotion = false;
                    
                    if (debugGestures)
                        Debug.Log($"Swing detected: {gestureType} - Intensity: {swingIntensity:F2}");
                }
            }
        }
        
        private void DetectShakeGesture(DSUMotionData currentData)
        {
            if (Time.time - lastGestureTime < gestureTimeout) return;
            
            // Check for rapid changes in acceleration (shake pattern)
            if (motionHistory.Count < 3) return;
            
            var historyArray = motionHistory.ToArray();
            float totalVariation = 0f;
            
            for (int i = 1; i < historyArray.Length; i++)
            {
                Vector3 accelDiff = historyArray[i].accelerometer - historyArray[i-1].accelerometer;
                totalVariation += accelDiff.magnitude;
            }
            
            float averageVariation = totalVariation / (historyArray.Length - 1);
            
            if (averageVariation > shakeThreshold)
            {
                MotionGestureEvent shakeEvent = new MotionGestureEvent(
                    MotionGesture.Shake,
                    Mathf.Clamp01(averageVariation / shakeThreshold),
                    Vector3.zero,
                    Time.time
                );
                
                OnGestureDetected?.Invoke(shakeEvent);
                lastGestureTime = Time.time;
                
                if (debugGestures)
                    Debug.Log($"Shake detected - Variation: {averageVariation:F2}");
            }
        }
        
        private void DetectBowlingSwing(DSUMotionData currentData)
        {
            if (Time.time - lastGestureTime < gestureTimeout) return;
            
            Vector3 currentAccel = currentData.accelerometer;
            Vector3 currentGyro = currentData.gyroscope;
            
            // Bowling swing detection: forward motion with controlled angle
            float forwardVelocity = Vector3.Dot(currentAccel, Vector3.forward);
            float sidewaysVelocity = Vector3.Dot(currentAccel, Vector3.right);
            
            // Check if motion is primarily forward
            if (forwardVelocity > bowlingSwingMinVelocity)
            {
                float swingAngle = Mathf.Atan2(sidewaysVelocity, forwardVelocity) * Mathf.Rad2Deg;
                
                if (Mathf.Abs(swingAngle) <= bowlingSwingMaxAngle)
                {
                    // Valid bowling swing detected
                    Vector3 throwDirection = new Vector3(sidewaysVelocity, 0, forwardVelocity).normalized;
                    float throwForce = Mathf.Clamp(forwardVelocity / bowlingSwingMinVelocity, 0.5f, 3.0f);
                    
                    OnBowlingSwingDetected?.Invoke(throwDirection, throwForce);
                    lastGestureTime = Time.time;
                    
                    if (debugGestures)
                        Debug.Log($"Bowling swing detected - Direction: {throwDirection}, Force: {throwForce:F2}");
                }
            }
        }
        
        private MotionGesture DetermineSwingDirection(Vector3 swingDirection)
        {
            // Determine primary swing direction based on the dominant axis
            float absX = Mathf.Abs(swingDirection.x);
            float absY = Mathf.Abs(swingDirection.y);
            float absZ = Mathf.Abs(swingDirection.z);
            
            if (absZ > absX && absZ > absY)
            {
                return swingDirection.z > 0 ? MotionGesture.SwingForward : MotionGesture.SwingBackward;
            }
            else if (absX > absY)
            {
                return swingDirection.x > 0 ? MotionGesture.SwingRight : MotionGesture.SwingLeft;
            }
            else
            {
                return MotionGesture.SwingForward; // Default to forward for vertical motions
            }
        }
        
        public void ResetGestureState()
        {
            isInSwingMotion = false;
            lastGestureTime = 0f;
            motionHistory.Clear();
            
            // Refill with empty data
            for (int i = 0; i < motionHistorySize; i++)
            {
                motionHistory.Enqueue(DSUMotionData.Empty);
            }
        }
        
        // Public getters for debugging
        public bool IsInSwingMotion => isInSwingMotion;
        public int MotionHistoryCount => motionHistory.Count;
        public DSUMotionData LastMotionData => lastMotionData;
    }
}