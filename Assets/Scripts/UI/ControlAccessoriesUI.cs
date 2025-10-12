using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;
using RiiSports.Input;

namespace RiiSports.UI
{
    /// <summary>
    /// Enhanced UI system for managing control accessories
    /// Provides comprehensive control panel for different input devices
    /// </summary>
    public class ControlAccessoriesUI : MonoBehaviour
    {
        [Header("Main Panel")]
        [SerializeField] private GameObject controlAccessoriesPanel;
        [SerializeField] private Button togglePanelButton;
        [SerializeField] private TextMeshProUGUI panelTitleText;
        
        [Header("Controller Selection")]
        [SerializeField] private TMP_Dropdown controllerTypeDropdown;
        [SerializeField] private Button refreshControllersButton;
        [SerializeField] private TextMeshProUGUI activeControllerText;
        
        [Header("Motion Controls Section")]
        [SerializeField] private GameObject motionControlsSection;
        [SerializeField] private Toggle enableMotionToggle;
        [SerializeField] private Slider motionSensitivitySlider;
        [SerializeField] private TextMeshProUGUI sensitivityValueText;
        [SerializeField] private Button calibrateMotionButton;
        [SerializeField] private Button testMotionButton;
        
        [Header("Gamepad Section")]
        [SerializeField] private GameObject gamepadSection;
        [SerializeField] private Toggle enableGamepadToggle;
        [SerializeField] private Slider gamepadSensitivitySlider;
        [SerializeField] private TextMeshProUGUI gamepadSensitivityText;
        [SerializeField] private Button testGamepadButton;
        
        [Header("Connection Settings")]
        [SerializeField] private GameObject connectionSection;
        [SerializeField] private TMP_InputField serverIPInput;
        [SerializeField] private TMP_InputField serverPortInput;
        [SerializeField] private Button connectButton;
        [SerializeField] private Button disconnectButton;
        [SerializeField] private Toggle autoConnectToggle;
        
        [Header("Status Display")]
        [SerializeField] private GameObject statusSection;
        [SerializeField] private TextMeshProUGUI connectionStatusText;
        [SerializeField] private Image connectionQualityBar;
        [SerializeField] private TextMeshProUGUI latencyText;
        [SerializeField] private Button diagnosticsButton;
        
        [Header("Calibration Wizard")]
        [SerializeField] private GameObject calibrationWizardPanel;
        [SerializeField] private TextMeshProUGUI calibrationInstructionText;
        [SerializeField] private Button calibrationNextButton;
        [SerializeField] private Button calibrationSkipButton;
        [SerializeField] private Slider calibrationProgressBar;
        
        [Header("Advanced Settings")]
        [SerializeField] private GameObject advancedSection;
        [SerializeField] private Toggle showAdvancedToggle;
        [SerializeField] private Slider gestureThresholdSlider;
        [SerializeField] private Slider motionSmoothingSlider;
        [SerializeField] private Toggle debugModeToggle;
        [SerializeField] private Button resetToDefaultsButton;
        
        // References
        private PlayerInputManager inputManager;
        private DSUClient dsuClient;
        private GamepadInputAccessory gamepadAccessory;
        private ControllerVisualization controllerVisualization;
        private DSUConfiguration dsuConfiguration;
        
        // State
        private bool isPanelVisible = false;
        private int calibrationStep = 0;
        private const int maxCalibrationSteps = 5;
        
        // Controller options
        private readonly string[] controllerOptions = {
            "Auto Detect",
            "Motion Controller (DSU)",
            "Gamepad",
            "Keyboard Only"
        };
        
        private void Start()
        {
            InitializeReferences();
            SetupUI();
            UpdateUI();
        }
        
        private void Update()
        {
            UpdateStatusDisplay();
        }
        
        private void InitializeReferences()
        {
            inputManager = FindObjectOfType<PlayerInputManager>();
            dsuClient = FindObjectOfType<DSUClient>();
            gamepadAccessory = FindObjectOfType<GamepadInputAccessory>();
            controllerVisualization = FindObjectOfType<ControllerVisualization>();
            
            // Try to find or create DSU configuration
            dsuConfiguration = Resources.Load<DSUConfiguration>("DSU Configuration");
            if (dsuConfiguration == null)
            {
                Debug.LogWarning("DSU Configuration not found in Resources folder");
            }
        }
        
        private void SetupUI()
        {
            // Setup main panel
            if (togglePanelButton != null)
                togglePanelButton.onClick.AddListener(TogglePanel);
            
            if (controlAccessoriesPanel != null)
                controlAccessoriesPanel.SetActive(isPanelVisible);
            
            // Setup controller selection
            SetupControllerDropdown();
            if (refreshControllersButton != null)
                refreshControllersButton.onClick.AddListener(RefreshControllers);
            
            // Setup motion controls
            SetupMotionControlsSection();
            
            // Setup gamepad section
            SetupGamepadSection();
            
            // Setup connection settings
            SetupConnectionSection();
            
            // Setup calibration wizard
            SetupCalibrationWizard();
            
            // Setup advanced settings
            SetupAdvancedSettings();
            
            // Setup status section
            if (diagnosticsButton != null)
                diagnosticsButton.onClick.AddListener(ShowDiagnostics);
        }
        
        private void SetupControllerDropdown()
        {
            if (controllerTypeDropdown != null)
            {
                controllerTypeDropdown.ClearOptions();
                controllerTypeDropdown.AddOptions(new List<string>(controllerOptions));
                controllerTypeDropdown.onValueChanged.AddListener(OnControllerTypeChanged);
            }
        }
        
        private void SetupMotionControlsSection()
        {
            if (enableMotionToggle != null)
            {
                enableMotionToggle.onValueChanged.AddListener(OnMotionToggleChanged);
                enableMotionToggle.isOn = inputManager != null && inputManager.IsMotionControlsEnabled;
            }
            
            if (motionSensitivitySlider != null)
            {
                motionSensitivitySlider.onValueChanged.AddListener(OnMotionSensitivityChanged);
                motionSensitivitySlider.value = dsuConfiguration != null ? dsuConfiguration.motionSensitivity : 1.0f;
            }
            
            if (calibrateMotionButton != null)
                calibrateMotionButton.onClick.AddListener(StartCalibrationWizard);
            
            if (testMotionButton != null)
                testMotionButton.onClick.AddListener(TestMotionControls);
        }
        
        private void SetupGamepadSection()
        {
            if (enableGamepadToggle != null)
            {
                enableGamepadToggle.onValueChanged.AddListener(OnGamepadToggleChanged);
                enableGamepadToggle.isOn = gamepadAccessory != null;
            }
            
            if (gamepadSensitivitySlider != null)
            {
                gamepadSensitivitySlider.onValueChanged.AddListener(OnGamepadSensitivityChanged);
                gamepadSensitivitySlider.value = 1.0f;
            }
            
            if (testGamepadButton != null)
                testGamepadButton.onClick.AddListener(TestGamepadControls);
        }
        
        private void SetupConnectionSection()
        {
            if (serverIPInput != null && dsuConfiguration != null)
                serverIPInput.text = dsuConfiguration.serverIP;
            
            if (serverPortInput != null && dsuConfiguration != null)
                serverPortInput.text = dsuConfiguration.serverPort.ToString();
            
            if (connectButton != null)
                connectButton.onClick.AddListener(ConnectToServer);
            
            if (disconnectButton != null)
                disconnectButton.onClick.AddListener(DisconnectFromServer);
            
            if (autoConnectToggle != null && dsuConfiguration != null)
            {
                autoConnectToggle.isOn = dsuConfiguration.autoConnect;
                autoConnectToggle.onValueChanged.AddListener(OnAutoConnectChanged);
            }
        }
        
        private void SetupCalibrationWizard()
        {
            if (calibrationWizardPanel != null)
                calibrationWizardPanel.SetActive(false);
            
            if (calibrationNextButton != null)
                calibrationNextButton.onClick.AddListener(NextCalibrationStep);
            
            if (calibrationSkipButton != null)
                calibrationSkipButton.onClick.AddListener(SkipCalibration);
        }
        
        private void SetupAdvancedSettings()
        {
            if (showAdvancedToggle != null)
            {
                showAdvancedToggle.onValueChanged.AddListener(OnShowAdvancedChanged);
                OnShowAdvancedChanged(showAdvancedToggle.isOn);
            }
            
            if (gestureThresholdSlider != null && dsuConfiguration != null)
            {
                gestureThresholdSlider.value = dsuConfiguration.swingThreshold;
                gestureThresholdSlider.onValueChanged.AddListener(OnGestureThresholdChanged);
            }
            
            if (motionSmoothingSlider != null && dsuConfiguration != null)
            {
                motionSmoothingSlider.value = dsuConfiguration.motionSmoothing;
                motionSmoothingSlider.onValueChanged.AddListener(OnMotionSmoothingChanged);
            }
            
            if (debugModeToggle != null && dsuConfiguration != null)
            {
                debugModeToggle.isOn = dsuConfiguration.debugLogging;
                debugModeToggle.onValueChanged.AddListener(OnDebugModeChanged);
            }
            
            if (resetToDefaultsButton != null)
                resetToDefaultsButton.onClick.AddListener(ResetToDefaults);
        }
        
        private void UpdateUI()
        {
            UpdateControllerSelection();
            UpdateMotionControlsDisplay();
            UpdateGamepadDisplay();
            UpdateConnectionDisplay();
            UpdateAdvancedDisplay();
        }
        
        private void UpdateControllerSelection()
        {
            if (activeControllerText != null)
            {
                string activeController = "None";
                
                if (gamepadAccessory != null && gamepadAccessory.IsGamepadConnected)
                    activeController = "Gamepad";
                else if (dsuClient != null && dsuClient.IsConnected)
                    activeController = "Motion Controller";
                else if (inputManager != null)
                    activeController = "Keyboard";
                
                activeControllerText.text = $"Active: {activeController}";
            }
        }
        
        private void UpdateMotionControlsDisplay()
        {
            bool motionAvailable = inputManager != null && dsuClient != null;
            
            if (motionControlsSection != null)
                motionControlsSection.SetActive(motionAvailable);
            
            if (sensitivityValueText != null && motionSensitivitySlider != null)
                sensitivityValueText.text = $"{motionSensitivitySlider.value:F1}x";
        }
        
        private void UpdateGamepadDisplay()
        {
            bool gamepadAvailable = gamepadAccessory != null;
            
            if (gamepadSection != null)
                gamepadSection.SetActive(gamepadAvailable);
            
            if (gamepadSensitivityText != null && gamepadSensitivitySlider != null)
                gamepadSensitivityText.text = $"{gamepadSensitivitySlider.value:F1}x";
        }
        
        private void UpdateConnectionDisplay()
        {
            bool showConnection = dsuClient != null;
            
            if (connectionSection != null)
                connectionSection.SetActive(showConnection);
            
            if (connectButton != null && disconnectButton != null && dsuClient != null)
            {
                bool isConnected = dsuClient.IsConnected;
                connectButton.interactable = !isConnected;
                disconnectButton.interactable = isConnected;
            }
        }
        
        private void UpdateStatusDisplay()
        {
            if (connectionStatusText != null)
            {
                string status = "Disconnected";
                Color statusColor = Color.red;
                
                if (dsuClient != null && dsuClient.IsConnected)
                {
                    status = "Connected";
                    statusColor = Color.green;
                }
                else if (gamepadAccessory != null && gamepadAccessory.IsGamepadConnected)
                {
                    status = "Gamepad Connected";
                    statusColor = Color.blue;
                }
                
                connectionStatusText.text = status;
                connectionStatusText.color = statusColor;
            }
            
            // Update connection quality bar (simulated for now)
            if (connectionQualityBar != null)
            {
                float quality = 1.0f;
                if (dsuClient != null && dsuClient.IsConnected)
                {
                    // In a real implementation, this would get actual connection quality
                    quality = Random.Range(0.8f, 1.0f);
                }
                else if (gamepadAccessory != null && gamepadAccessory.IsGamepadConnected)
                {
                    quality = 1.0f; // Wired/USB gamepads have perfect connection
                }
                else
                {
                    quality = 0.0f;
                }
                
                connectionQualityBar.fillAmount = quality;
            }
            
            // Update latency display (simulated)
            if (latencyText != null)
            {
                int latency = 0;
                if (dsuClient != null && dsuClient.IsConnected)
                    latency = Random.Range(20, 80); // Typical WiFi latency
                else if (gamepadAccessory != null && gamepadAccessory.IsGamepadConnected)
                    latency = Random.Range(1, 5); // Very low latency for wired
                
                latencyText.text = $"Latency: {latency}ms";
            }
        }
        
        private void UpdateAdvancedDisplay()
        {
            if (advancedSection != null && showAdvancedToggle != null)
            {
                advancedSection.SetActive(showAdvancedToggle.isOn);
            }
        }
        
        // Event handlers
        private void TogglePanel()
        {
            isPanelVisible = !isPanelVisible;
            if (controlAccessoriesPanel != null)
                controlAccessoriesPanel.SetActive(isPanelVisible);
        }
        
        private void OnControllerTypeChanged(int index)
        {
            // Handle controller type selection
            switch (index)
            {
                case 0: // Auto Detect
                    // Enable all available controllers
                    if (inputManager != null)
                        inputManager.EnableMotionControls(true);
                    if (gamepadAccessory != null)
                        gamepadAccessory.EnableGamepadInput(true);
                    break;
                case 1: // Motion Controller only
                    if (inputManager != null)
                        inputManager.EnableMotionControls(true);
                    if (gamepadAccessory != null)
                        gamepadAccessory.EnableGamepadInput(false);
                    break;
                case 2: // Gamepad only
                    if (inputManager != null)
                        inputManager.EnableMotionControls(false);
                    if (gamepadAccessory != null)
                        gamepadAccessory.EnableGamepadInput(true);
                    break;
                case 3: // Keyboard only
                    if (inputManager != null)
                        inputManager.EnableMotionControls(false);
                    if (gamepadAccessory != null)
                        gamepadAccessory.EnableGamepadInput(false);
                    break;
            }
        }
        
        private void RefreshControllers()
        {
            // Refresh controller detection
            UpdateUI();
        }
        
        private void OnMotionToggleChanged(bool enabled)
        {
            if (inputManager != null)
                inputManager.EnableMotionControls(enabled);
        }
        
        private void OnMotionSensitivityChanged(float value)
        {
            // Apply to bowling ball or other motion-sensitive components
            BowlingBall bowlingBall = FindObjectOfType<BowlingBall>();
            if (bowlingBall != null)
            {
                bowlingBall.SetMotionSensitivity(value);
            }
            
            if (sensitivityValueText != null)
                sensitivityValueText.text = $"{value:F1}x";
        }
        
        private void OnGamepadToggleChanged(bool enabled)
        {
            if (gamepadAccessory != null)
                gamepadAccessory.EnableGamepadInput(enabled);
        }
        
        private void OnGamepadSensitivityChanged(float value)
        {
            if (gamepadAccessory != null)
                gamepadAccessory.SetGamepadSensitivity(value);
            
            if (gamepadSensitivityText != null)
                gamepadSensitivityText.text = $"{value:F1}x";
        }
        
        private void ConnectToServer()
        {
            if (dsuClient != null)
            {
                // Update configuration if inputs are available
                if (serverIPInput != null && !string.IsNullOrEmpty(serverIPInput.text))
                {
                    // In a real implementation, this would update the DSU client's server IP
                    Debug.Log($"Connecting to {serverIPInput.text}:{serverPortInput.text}");
                }
                
                dsuClient.Connect();
            }
        }
        
        private void DisconnectFromServer()
        {
            if (dsuClient != null)
                dsuClient.Disconnect();
        }
        
        private void OnAutoConnectChanged(bool enabled)
        {
            if (dsuConfiguration != null)
                dsuConfiguration.autoConnect = enabled;
        }
        
        private void StartCalibrationWizard()
        {
            calibrationStep = 0;
            if (calibrationWizardPanel != null)
                calibrationWizardPanel.SetActive(true);
            
            UpdateCalibrationStep();
        }
        
        private void NextCalibrationStep()
        {
            calibrationStep++;
            if (calibrationStep >= maxCalibrationSteps)
            {
                CompleteCalibration();
            }
            else
            {
                UpdateCalibrationStep();
            }
        }
        
        private void SkipCalibration()
        {
            if (calibrationWizardPanel != null)
                calibrationWizardPanel.SetActive(false);
        }
        
        private void UpdateCalibrationStep()
        {
            if (calibrationInstructionText != null)
            {
                string[] instructions = {
                    "Hold your controller naturally and press Next",
                    "Make a gentle bowling motion and press Next",
                    "Hold the controller steady for 3 seconds",
                    "Make a strong bowling motion and press Next",
                    "Calibration complete! Press Next to finish"
                };
                
                if (calibrationStep < instructions.Length)
                    calibrationInstructionText.text = instructions[calibrationStep];
            }
            
            if (calibrationProgressBar != null)
            {
                calibrationProgressBar.value = (float)calibrationStep / maxCalibrationSteps;
            }
        }
        
        private void CompleteCalibration()
        {
            if (calibrationWizardPanel != null)
                calibrationWizardPanel.SetActive(false);
            
            Debug.Log("Calibration completed");
        }
        
        private void TestMotionControls()
        {
            Debug.Log("Testing motion controls...");
            // In a real implementation, this would trigger a test sequence
        }
        
        private void TestGamepadControls()
        {
            Debug.Log("Testing gamepad controls...");
            // In a real implementation, this would trigger a test sequence
        }
        
        private void ShowDiagnostics()
        {
            string diagnostics = "=== Control Accessories Diagnostics ===\n";
            diagnostics += $"Motion Controls: {(inputManager != null && inputManager.IsMotionControlsEnabled ? "Enabled" : "Disabled")}\n";
            diagnostics += $"DSU Connected: {(dsuClient != null && dsuClient.IsConnected ? "Yes" : "No")}\n";
            diagnostics += $"Gamepad Connected: {(gamepadAccessory != null && gamepadAccessory.IsGamepadConnected ? "Yes" : "No")}\n";
            diagnostics += $"Controller Visualization: {(controllerVisualization != null ? "Active" : "Inactive")}\n";
            
            Debug.Log(diagnostics);
        }
        
        private void OnShowAdvancedChanged(bool show)
        {
            UpdateAdvancedDisplay();
        }
        
        private void OnGestureThresholdChanged(float value)
        {
            if (dsuConfiguration != null)
                dsuConfiguration.swingThreshold = value;
        }
        
        private void OnMotionSmoothingChanged(float value)
        {
            if (dsuConfiguration != null)
                dsuConfiguration.motionSmoothing = value;
        }
        
        private void OnDebugModeChanged(bool enabled)
        {
            if (dsuConfiguration != null)
                dsuConfiguration.debugLogging = enabled;
        }
        
        private void ResetToDefaults()
        {
            if (dsuConfiguration != null)
            {
                dsuConfiguration.ResetToDefaults();
                
                // Update UI to reflect defaults
                if (motionSensitivitySlider != null)
                    motionSensitivitySlider.value = dsuConfiguration.motionSensitivity;
                
                if (gestureThresholdSlider != null)
                    gestureThresholdSlider.value = dsuConfiguration.swingThreshold;
                
                if (motionSmoothingSlider != null)
                    motionSmoothingSlider.value = dsuConfiguration.motionSmoothing;
                
                if (debugModeToggle != null)
                    debugModeToggle.isOn = dsuConfiguration.debugLogging;
                
                if (serverIPInput != null)
                    serverIPInput.text = dsuConfiguration.serverIP;
                
                if (serverPortInput != null)
                    serverPortInput.text = dsuConfiguration.serverPort.ToString();
            }
        }
        
        // Public methods for external control
        public void ShowControlAccessoriesPanel(bool show)
        {
            isPanelVisible = show;
            if (controlAccessoriesPanel != null)
                controlAccessoriesPanel.SetActive(show);
        }
        
        public void SetControllerType(int typeIndex)
        {
            if (controllerTypeDropdown != null)
            {
                controllerTypeDropdown.value = typeIndex;
                OnControllerTypeChanged(typeIndex);
            }
        }
        
        public bool IsPanelVisible => isPanelVisible;
        
        // Context menu methods for testing
        [ContextMenu("Show Diagnostics")]
        private void TestShowDiagnostics()
        {
            ShowDiagnostics();
        }
        
        [ContextMenu("Start Calibration")]
        private void TestStartCalibration()
        {
            StartCalibrationWizard();
        }
        
        [ContextMenu("Reset All Settings")]
        private void TestResetSettings()
        {
            ResetToDefaults();
        }
    }