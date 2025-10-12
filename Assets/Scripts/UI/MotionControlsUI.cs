using UnityEngine;
using UnityEngine.UI;
using TMPro;
using RiiSports.Input;

namespace RiiSports.UI
{
    /// <summary>
    /// UI component for displaying motion control status and basic configuration
    /// </summary>
    public class MotionControlsUI : MonoBehaviour
    {
        [Header("UI References")]
        [SerializeField] private GameObject motionControlsPanel;
        [SerializeField] private TextMeshProUGUI connectionStatusText;
        [SerializeField] private TextMeshProUGUI motionDataText;
        [SerializeField] private Button connectButton;
        [SerializeField] private Button disconnectButton;
        [SerializeField] private Toggle enableMotionToggle;
        [SerializeField] private Slider sensitivitySlider;
        [SerializeField] private TextMeshProUGUI sensitivityValueText;
        
        [Header("Settings")]
        [SerializeField] private bool showMotionData = false;
        [SerializeField] private float updateInterval = 0.1f;
        
        // References
        private PlayerInputManager inputManager;
        private DSUClient dsuClient;
        private MotionGestureDetector gestureDetector;
        
        // Update timing
        private float lastUpdateTime = 0f;
        
        private void Start()
        {
            InitializeReferences();
            SetupUI();
            UpdateUI();
        }
        
        private void Update()
        {
            if (Time.time - lastUpdateTime >= updateInterval)
            {
                UpdateUI();
                lastUpdateTime = Time.time;
            }
        }
        
        private void InitializeReferences()
        {
            // Find input manager
            inputManager = FindObjectOfType<PlayerInputManager>();
            
            if (inputManager != null)
            {
                // Find DSU client and gesture detector
                dsuClient = FindObjectOfType<DSUClient>();
                gestureDetector = FindObjectOfType<MotionGestureDetector>();
            }
        }
        
        private void SetupUI()
        {
            // Setup button events
            if (connectButton != null)
                connectButton.onClick.AddListener(OnConnectClicked);
            
            if (disconnectButton != null)
                disconnectButton.onClick.AddListener(OnDisconnectClicked);
            
            if (enableMotionToggle != null)
            {
                enableMotionToggle.onValueChanged.AddListener(OnMotionToggleChanged);
                enableMotionToggle.isOn = inputManager != null && inputManager.IsMotionControlsEnabled;
            }
            
            if (sensitivitySlider != null)
            {
                sensitivitySlider.onValueChanged.AddListener(OnSensitivityChanged);
                sensitivitySlider.value = 1.0f; // Default sensitivity
            }
            
            // Hide panel if motion controls not available
            if (motionControlsPanel != null && inputManager == null)
            {
                motionControlsPanel.SetActive(false);
            }
        }
        
        private void UpdateUI()
        {
            UpdateConnectionStatus();
            UpdateMotionData();
            UpdateButtons();
            UpdateSensitivityDisplay();
        }
        
        private void UpdateConnectionStatus()
        {
            if (connectionStatusText == null) return;
            
            string status = "Motion Controls: ";
            Color statusColor = Color.white;
            
            if (inputManager == null)
            {
                status += "Not Available";
                statusColor = Color.gray;
            }
            else if (!inputManager.IsMotionControlsEnabled)
            {
                status += "Disabled";
                statusColor = Color.yellow;
            }
            else if (dsuClient != null && dsuClient.IsConnected)
            {
                status += "Connected";
                statusColor = Color.green;
            }
            else
            {
                status += "Disconnected";
                statusColor = Color.red;
            }
            
            connectionStatusText.text = status;
            connectionStatusText.color = statusColor;
        }
        
        private void UpdateMotionData()
        {
            if (motionDataText == null || !showMotionData) 
            {
                if (motionDataText != null)
                    motionDataText.gameObject.SetActive(false);
                return;
            }
            
            motionDataText.gameObject.SetActive(true);
            
            if (inputManager != null && inputManager.IsMotionControlsActive)
            {
                DSUMotionData data = inputManager.GetCurrentMotionData();
                
                string motionInfo = $"Accelerometer: {data.accelerometer:F2}\n";
                motionInfo += $"Gyroscope: {data.gyroscope:F2}\n";
                motionInfo += $"Orientation: {data.orientation:F1}°";
                
                motionDataText.text = motionInfo;
            }
            else
            {
                motionDataText.text = "No motion data";
            }
        }
        
        private void UpdateButtons()
        {
            bool isConnected = dsuClient != null && dsuClient.IsConnected;
            bool canConnect = inputManager != null && inputManager.IsMotionControlsEnabled;
            
            if (connectButton != null)
            {
                connectButton.interactable = canConnect && !isConnected;
            }
            
            if (disconnectButton != null)
            {
                disconnectButton.interactable = isConnected;
            }
        }
        
        private void UpdateSensitivityDisplay()
        {
            if (sensitivityValueText != null && sensitivitySlider != null)
            {
                sensitivityValueText.text = $"{sensitivitySlider.value:F1}x";
            }
        }
        
        private void OnConnectClicked()
        {
            if (dsuClient != null)
            {
                dsuClient.Connect();
            }
        }
        
        private void OnDisconnectClicked()
        {
            if (dsuClient != null)
            {
                dsuClient.Disconnect();
            }
        }
        
        private void OnMotionToggleChanged(bool enabled)
        {
            if (inputManager != null)
            {
                inputManager.EnableMotionControls(enabled);
            }
        }
        
        private void OnSensitivityChanged(float value)
        {
            // Apply sensitivity to bowling ball if available
            BowlingBall bowlingBall = FindObjectOfType<BowlingBall>();
            if (bowlingBall != null)
            {
                bowlingBall.SetMotionSensitivity(value);
            }
        }
        
        // Public methods for external control
        public void ShowMotionControlsPanel(bool show)
        {
            if (motionControlsPanel != null)
            {
                motionControlsPanel.SetActive(show);
            }
        }
        
        public void SetShowMotionData(bool show)
        {
            showMotionData = show;
        }
        
        public void SetUpdateInterval(float interval)
        {
            updateInterval = Mathf.Max(0.05f, interval);
        }
        
        // Context menu methods for testing
        [ContextMenu("Test Connect")]
        private void TestConnect()
        {
            OnConnectClicked();
        }
        
        [ContextMenu("Test Disconnect")]
        private void TestDisconnect()
        {
            OnDisconnectClicked();
        }
        
        [ContextMenu("Toggle Motion Data Display")]
        private void ToggleMotionDataDisplay()
        {
            showMotionData = !showMotionData;
        }
    }
}