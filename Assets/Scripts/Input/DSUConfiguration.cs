using UnityEngine;

namespace RiiSports.Input
{
    /// <summary>
    /// Configuration manager for DSU motion controls
    /// </summary>
    [CreateAssetMenu(fileName = "DSU Configuration", menuName = "Rii Sports/DSU Configuration")]
    public class DSUConfiguration : ScriptableObject
    {
        [Header("Connection Settings")]
        [Tooltip("IP address of the DSU motion provider server")]
        public string serverIP = "127.0.0.1";
        
        [Tooltip("Port number for DSU communication")]
        [Range(1024, 65535)]
        public int serverPort = 26760;
        
        [Tooltip("Automatically connect to DSU server on start")]
        public bool autoConnect = true;
        
        [Tooltip("Connection timeout in seconds")]
        [Range(1f, 30f)]
        public float connectionTimeout = 5f;
        
        [Header("Motion Sensitivity")]
        [Tooltip("Overall motion sensitivity multiplier")]
        [Range(0.1f, 5.0f)]
        public float motionSensitivity = 1.0f;
        
        [Tooltip("Minimum acceleration threshold for gesture detection")]
        [Range(0.5f, 5.0f)]
        public float swingThreshold = 2.0f;
        
        [Tooltip("Shake detection threshold")]
        [Range(1.0f, 10.0f)]
        public float shakeThreshold = 3.0f;
        
        [Header("Bowling Settings")]
        [Tooltip("Minimum velocity for bowling swing detection")]
        [Range(0.5f, 3.0f)]
        public float bowlingSwingMinVelocity = 1.5f;
        
        [Tooltip("Maximum angle deviation for valid bowling swing")]
        [Range(15f, 90f)]
        public float bowlingSwingMaxAngle = 45f;
        
        [Tooltip("Force multiplier for motion-based throws")]
        [Range(50f, 500f)]
        public float motionForceMultiplier = 200f;
        
        [Header("Calibration")]
        [Tooltip("Accelerometer calibration offset")]
        public Vector3 accelerometerOffset = Vector3.zero;
        
        [Tooltip("Gyroscope calibration offset")]
        public Vector3 gyroscopeOffset = Vector3.zero;
        
        [Tooltip("Motion smoothing factor (0 = no smoothing, 1 = maximum smoothing)")]
        [Range(0f, 0.9f)]
        public float motionSmoothing = 0.1f;
        
        [Header("Debug Settings")]
        [Tooltip("Enable debug logging for DSU communication")]
        public bool debugLogging = false;
        
        [Tooltip("Enable gesture detection debugging")]
        public bool debugGestures = false;
        
        [Tooltip("Show motion data in UI")]
        public bool showMotionDataUI = false;
        
        [Header("Advanced")]
        [Tooltip("Motion data history size for gesture detection")]
        [Range(5, 20)]
        public int motionHistorySize = 10;
        
        [Tooltip("Gesture timeout to prevent rapid repeated detection")]
        [Range(0.1f, 2.0f)]
        public float gestureTimeout = 0.5f;
        
        [Tooltip("Maximum throw force limit")]
        [Range(500f, 3000f)]
        public float maxThrowForce = 1500f;
        
        [Tooltip("Minimum throw force limit")]
        [Range(50f, 500f)]
        public float minThrowForce = 100f;
        
        /// <summary>
        /// Apply this configuration to a DSU client
        /// </summary>
        public void ApplyToClient(DSUClient client)
        {
            if (client == null) return;
            
            // Note: These would need to be exposed as public properties in DSUClient
            // For now, this serves as a template for configuration application
        }
        
        /// <summary>
        /// Apply this configuration to a gesture detector
        /// </summary>
        public void ApplyToGestureDetector(MotionGestureDetector detector)
        {
            if (detector == null) return;
            
            // Note: These would need to be exposed as public properties in MotionGestureDetector
            // For now, this serves as a template for configuration application
        }
        
        /// <summary>
        /// Reset to default values
        /// </summary>
        [ContextMenu("Reset to Defaults")]
        public void ResetToDefaults()
        {
            serverIP = "127.0.0.1";
            serverPort = 26760;
            autoConnect = true;
            connectionTimeout = 5f;
            motionSensitivity = 1.0f;
            swingThreshold = 2.0f;
            shakeThreshold = 3.0f;
            bowlingSwingMinVelocity = 1.5f;
            bowlingSwingMaxAngle = 45f;
            motionForceMultiplier = 200f;
            accelerometerOffset = Vector3.zero;
            gyroscopeOffset = Vector3.zero;
            motionSmoothing = 0.1f;
            debugLogging = false;
            debugGestures = false;
            showMotionDataUI = false;
            motionHistorySize = 10;
            gestureTimeout = 0.5f;
            maxThrowForce = 1500f;
            minThrowForce = 100f;
        }
        
        /// <summary>
        /// Validate configuration values
        /// </summary>
        public bool ValidateConfiguration()
        {
            bool isValid = true;
            
            if (serverPort < 1024 || serverPort > 65535)
            {
                Debug.LogWarning("DSU Configuration: Invalid server port. Must be between 1024 and 65535.");
                isValid = false;
            }
            
            if (string.IsNullOrEmpty(serverIP))
            {
                Debug.LogWarning("DSU Configuration: Server IP cannot be empty.");
                isValid = false;
            }
            
            if (motionSensitivity <= 0)
            {
                Debug.LogWarning("DSU Configuration: Motion sensitivity must be greater than 0.");
                isValid = false;
            }
            
            if (maxThrowForce <= minThrowForce)
            {
                Debug.LogWarning("DSU Configuration: Maximum throw force must be greater than minimum throw force.");
                isValid = false;
            }
            
            return isValid;
        }
    }
}