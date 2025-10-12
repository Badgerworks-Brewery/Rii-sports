using UnityEngine;
using UnityEngine.UI;
using TMPro;
using RiiSports.Input;

namespace RiiSports.Input
{
    /// <summary>
    /// Visual representation system for different controller types
    /// Shows controller status, orientation, and connection quality
    /// </summary>
    public class ControllerVisualization : MonoBehaviour
    {
        [Header("Controller Display")]
        [SerializeField] private GameObject controllerDisplayPanel;
        [SerializeField] private Image controllerIcon;
        [SerializeField] private TextMeshProUGUI controllerNameText;
        [SerializeField] private TextMeshProUGUI connectionStatusText;
        
        [Header("Controller Icons")]
        [SerializeField] private Sprite phoneIcon;
        [SerializeField] private Sprite gamepadIcon;
        [SerializeField] private Sprite motionControllerIcon;
        [SerializeField] private Sprite keyboardIcon;
        
        [Header("Status Indicators")]
        [SerializeField] private Image connectionQualityBar;
        [SerializeField] private Image batteryIndicator;
        [SerializeField] private GameObject orientationDisplay;
        [SerializeField] private Transform orientationVisualizer;
        
        [Header("Visual Feedback")]
        [SerializeField] private GameObject actionFeedbackEffect;
        [SerializeField] private ParticleSystem gestureParticles;
        [SerializeField] private AudioSource feedbackAudioSource;
        [SerializeField] private AudioClip connectSound;
        [SerializeField] private AudioClip disconnectSound;
        [SerializeField] private AudioClip actionSound;
        
        // Controller state
        private ControllerType currentControllerType = ControllerType.None;
        private bool isConnected = false;
        private float connectionQuality = 1.0f;
        private float batteryLevel = 1.0f;
        private Vector3 currentOrientation = Vector3.zero;
        
        // References
        private PlayerInputManager inputManager;
        private DSUClient dsuClient;
        private GamepadInputAccessory gamepadAccessory;
        
        // Animation
        private Coroutine feedbackCoroutine;
        
        public enum ControllerType
        {
            None,
            Phone,
            Gamepad,
            MotionController,
            Keyboard
        }
        
        private void Start()
        {
            InitializeReferences();
            SetupVisualization();
            UpdateDisplay();
        }
        
        private void Update()
        {
            UpdateControllerStatus();
            UpdateOrientationDisplay();
        }
        
        private void InitializeReferences()
        {
            inputManager = FindObjectOfType<PlayerInputManager>();
            dsuClient = FindObjectOfType<DSUClient>();
            gamepadAccessory = FindObjectOfType<GamepadInputAccessory>();
            
            // Subscribe to input events
            if (inputManager != null)
            {
                inputManager.OnMotionGesture += OnMotionGestureDetected;
                inputManager.OnMotionThrow += OnMotionThrowDetected;
            }
            
            if (gamepadAccessory != null)
            {
                gamepadAccessory.OnGamepadThrow += OnGamepadThrowDetected;
                gamepadAccessory.OnGamepadAim += OnGamepadAimDetected;
            }
            
            if (dsuClient != null)
            {
                dsuClient.OnConnected += OnControllerConnected;
                dsuClient.OnDisconnected += OnControllerDisconnected;
            }
        }
        
        private void SetupVisualization()
        {
            if (controllerDisplayPanel != null)
            {
                controllerDisplayPanel.SetActive(true);
            }
            
            // Initialize visual elements
            UpdateControllerIcon();
            UpdateConnectionStatus();
            UpdateBatteryDisplay();
            UpdateConnectionQuality();
        }
        
        private void UpdateDisplay()
        {
            UpdateControllerIcon();
            UpdateConnectionStatus();
            UpdateBatteryDisplay();
            UpdateConnectionQuality();
        }
        
        private void UpdateControllerStatus()
        {
            ControllerType newType = DetectControllerType();
            bool newConnectionStatus = IsControllerConnected();
            
            if (newType != currentControllerType || newConnectionStatus != isConnected)
            {
                currentControllerType = newType;
                isConnected = newConnectionStatus;
                UpdateDisplay();
                
                // Play connection sound
                if (isConnected && feedbackAudioSource != null && connectSound != null)
                {
                    feedbackAudioSource.PlayOneShot(connectSound);
                }
                else if (!isConnected && feedbackAudioSource != null && disconnectSound != null)
                {
                    feedbackAudioSource.PlayOneShot(disconnectSound);
                }
            }
        }
        
        private ControllerType DetectControllerType()
        {
            if (gamepadAccessory != null && gamepadAccessory.IsGamepadConnected)
                return ControllerType.Gamepad;
            
            if (dsuClient != null && dsuClient.IsConnected)
                return ControllerType.Phone; // Assuming DSU is primarily used with phones
            
            if (inputManager != null && inputManager.IsMotionControlsActive)
                return ControllerType.MotionController;
            
            return ControllerType.Keyboard; // Fallback to keyboard
        }
        
        private bool IsControllerConnected()
        {
            switch (currentControllerType)
            {
                case ControllerType.Gamepad:
                    return gamepadAccessory != null && gamepadAccessory.IsGamepadConnected;
                case ControllerType.Phone:
                case ControllerType.MotionController:
                    return dsuClient != null && dsuClient.IsConnected;
                case ControllerType.Keyboard:
                    return true; // Keyboard is always "connected"
                default:
                    return false;
            }
        }
        
        private void UpdateControllerIcon()
        {
            if (controllerIcon == null) return;
            
            Sprite iconToUse = null;
            string controllerName = "Unknown";
            
            switch (currentControllerType)
            {
                case ControllerType.Phone:
                    iconToUse = phoneIcon;
                    controllerName = "Smartphone";
                    break;
                case ControllerType.Gamepad:
                    iconToUse = gamepadIcon;
                    controllerName = "Gamepad";
                    break;
                case ControllerType.MotionController:
                    iconToUse = motionControllerIcon;
                    controllerName = "Motion Controller";
                    break;
                case ControllerType.Keyboard:
                    iconToUse = keyboardIcon;
                    controllerName = "Keyboard";
                    break;
            }
            
            controllerIcon.sprite = iconToUse;
            
            if (controllerNameText != null)
            {
                controllerNameText.text = controllerName;
            }
        }
        
        private void UpdateConnectionStatus()
        {
            if (connectionStatusText == null) return;
            
            string status = isConnected ? "Connected" : "Disconnected";
            Color statusColor = isConnected ? Color.green : Color.red;
            
            connectionStatusText.text = status;
            connectionStatusText.color = statusColor;
        }
        
        private void UpdateBatteryDisplay()
        {
            if (batteryIndicator == null) return;
            
            // For now, simulate battery level - in a real implementation,
            // this would get actual battery data from the controller
            batteryIndicator.fillAmount = batteryLevel;
            
            Color batteryColor = Color.green;
            if (batteryLevel < 0.3f)
                batteryColor = Color.red;
            else if (batteryLevel < 0.6f)
                batteryColor = Color.yellow;
            
            batteryIndicator.color = batteryColor;
        }
        
        private void UpdateConnectionQuality()
        {
            if (connectionQualityBar == null) return;
            
            connectionQualityBar.fillAmount = connectionQuality;
            
            Color qualityColor = Color.green;
            if (connectionQuality < 0.3f)
                qualityColor = Color.red;
            else if (connectionQuality < 0.7f)
                qualityColor = Color.yellow;
            
            connectionQualityBar.color = qualityColor;
        }
        
        private void UpdateOrientationDisplay()
        {
            if (orientationDisplay == null || orientationVisualizer == null) return;
            
            bool showOrientation = currentControllerType == ControllerType.Phone || 
                                 currentControllerType == ControllerType.MotionController;
            
            orientationDisplay.SetActive(showOrientation && isConnected);
            
            if (showOrientation && inputManager != null)
            {
                DSUMotionData motionData = inputManager.GetCurrentMotionData();
                if (motionData.accelerometer != Vector3.zero)
                {
                    // Convert accelerometer data to rotation for visualization
                    Vector3 rotation = new Vector3(
                        -motionData.accelerometer.z * 90f,
                        motionData.accelerometer.x * 90f,
                        motionData.accelerometer.y * 90f
                    );
                    
                    orientationVisualizer.rotation = Quaternion.Lerp(
                        orientationVisualizer.rotation,
                        Quaternion.Euler(rotation),
                        Time.deltaTime * 5f
                    );
                }
            }
        }
        
        // Event handlers
        private void OnMotionGestureDetected(MotionGestureEvent gestureEvent)
        {
            TriggerActionFeedback();
        }
        
        private void OnMotionThrowDetected(Vector3 direction, float force)
        {
            TriggerActionFeedback();
        }
        
        private void OnGamepadThrowDetected(Vector3 direction, float force)
        {
            TriggerActionFeedback();
        }
        
        private void OnGamepadAimDetected(Vector2 aimInput)
        {
            // Could add subtle feedback for aiming
        }
        
        private void OnControllerConnected()
        {
            // Connection feedback is handled in UpdateControllerStatus
        }
        
        private void OnControllerDisconnected()
        {
            // Disconnection feedback is handled in UpdateControllerStatus
        }
        
        private void TriggerActionFeedback()
        {
            // Visual feedback
            if (actionFeedbackEffect != null)
            {
                actionFeedbackEffect.SetActive(false);
                actionFeedbackEffect.SetActive(true);
            }
            
            // Particle feedback
            if (gestureParticles != null)
            {
                gestureParticles.Play();
            }
            
            // Audio feedback
            if (feedbackAudioSource != null && actionSound != null)
            {
                feedbackAudioSource.PlayOneShot(actionSound);
            }
            
            // Haptic feedback for gamepad
            if (currentControllerType == ControllerType.Gamepad && gamepadAccessory != null)
            {
                gamepadAccessory.TriggerHapticFeedback(0.3f, 0.7f, 0.1f);
            }
        }
        
        // Public methods for external control
        public void SetBatteryLevel(float level)
        {
            batteryLevel = Mathf.Clamp01(level);
        }
        
        public void SetConnectionQuality(float quality)
        {
            connectionQuality = Mathf.Clamp01(quality);
        }
        
        public void ShowControllerDisplay(bool show)
        {
            if (controllerDisplayPanel != null)
            {
                controllerDisplayPanel.SetActive(show);
            }
        }
        
        private void OnDestroy()
        {
            // Unsubscribe from events
            if (inputManager != null)
            {
                inputManager.OnMotionGesture -= OnMotionGestureDetected;
                inputManager.OnMotionThrow -= OnMotionThrowDetected;
            }
            
            if (gamepadAccessory != null)
            {
                gamepadAccessory.OnGamepadThrow -= OnGamepadThrowDetected;
                gamepadAccessory.OnGamepadAim -= OnGamepadAimDetected;
            }
            
            if (dsuClient != null)
            {
                dsuClient.OnConnected -= OnControllerConnected;
                dsuClient.OnDisconnected -= OnControllerDisconnected;
            }
        }
    }
}