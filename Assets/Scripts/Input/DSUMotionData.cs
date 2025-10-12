using System;
using UnityEngine;

namespace RiiSports.Input
{
    /// <summary>
    /// Represents motion data received from DSU (Cemuhook Motion Provider) protocol
    /// </summary>
    [Serializable]
    public struct DSUMotionData
    {
        public Vector3 accelerometer;
        public Vector3 gyroscope;
        public Vector3 orientation;
        public bool isConnected;
        public float timestamp;
        
        public DSUMotionData(Vector3 accel, Vector3 gyro, Vector3 orient, bool connected, float time)
        {
            accelerometer = accel;
            gyroscope = gyro;
            orientation = orient;
            isConnected = connected;
            timestamp = time;
        }
        
        public static DSUMotionData Empty => new DSUMotionData(Vector3.zero, Vector3.zero, Vector3.zero, false, 0f);
    }
    
    /// <summary>
    /// Represents a motion gesture detected from DSU data
    /// </summary>
    public enum MotionGesture
    {
        None,
        SwingForward,
        SwingBackward,
        SwingLeft,
        SwingRight,
        Shake,
        Tilt
    }
    
    /// <summary>
    /// Motion gesture event data
    /// </summary>
    [Serializable]
    public struct MotionGestureEvent
    {
        public MotionGesture gesture;
        public float intensity;
        public Vector3 direction;
        public float timestamp;
        
        public MotionGestureEvent(MotionGesture gestureType, float gestureIntensity, Vector3 gestureDirection, float time)
        {
            gesture = gestureType;
            intensity = gestureIntensity;
            direction = gestureDirection;
            timestamp = time;
        }
    }
}