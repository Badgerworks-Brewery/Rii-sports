using UnityEngine;
using RiiSports.Input;
using RiiSports.UI;

namespace RiiSports.Utils
{
    /// <summary>
    /// Utility script to automatically set up control accessories in a scene
    /// Attach this to a GameObject to automatically configure the control system
    /// </summary>
    public class ControlAccessoriesSetup : MonoBehaviour
    {
        [Header("Auto Setup Options")]
        [SerializeField] private bool autoSetupOnStart = true;
        [SerializeField] private bool createUICanvas = true;
        [SerializeField] private bool enableDebugMode = false;
        
        [Header("Component References")]
        [SerializeField] private PlayerInputManager playerInputManager;
        [SerializeField] private Canvas uiCanvas;
        [SerializeField] private GameObject controlAccessoriesUIPrefab;
        
        [Header("Default Settings")]
        [SerializeField] private float defaultMotionSensitivity = 1.0f;
        [SerializeField] private float defaultGamepadSensitivity = 1.0f;
        [SerializeField] private string defaultServerIP = "127.0.0.1";
        [SerializeField] private int defaultServerPort = 26760;
        
        private void Start()
        {
            if (autoSetupOnStart)
            {
                SetupControlAccessories();
            }
        }
        
        [ContextMenu("Setup Control Accessories")]
        public void SetupControlAccessories()
        {
            Debug.Log("Setting up Control Accessories system...");
            
            // Find or create PlayerInputManager
            SetupPlayerInputManager();
            
            // Setup UI Canvas if needed
            if (createUICanvas)
            {
                SetupUICanvas();
            }
            
            // Setup Control Accessories UI
            SetupControlAccessoriesUI();
            
            // Apply default settings
            ApplyDefaultSettings();
            
            Debug.Log("Control Accessories setup complete!");
        }
        
        private void SetupPlayerInputManager()
        {
            if (playerInputManager == null)
            {
                playerInputManager = FindObjectOfType<PlayerInputManager>();
            }
            
            if (playerInputManager == null)
            {
                GameObject inputManagerGO = new GameObject("Player Input Manager");
                playerInputManager = inputManagerGO.AddComponent<PlayerInputManager>();
                inputManagerGO.transform.SetParent(transform);
                
                Debug.Log("Created PlayerInputManager");
            }
            
            // Ensure all required components are present
            EnsureInputComponents();
        }
        
        private void EnsureInputComponents()
        {
            if (playerInputManager == null) return;
            
            // Check for DSU Client
            DSUClient dsuClient = playerInputManager.GetComponentInChildren<DSUClient>();
            if (dsuClient == null)
            {
                GameObject dsuGO = new GameObject("DSU Client");
                dsuClient = dsuGO.AddComponent<DSUClient>();
                dsuGO.transform.SetParent(playerInputManager.transform);
            }
            
            // Check for Motion Gesture Detector
            MotionGestureDetector gestureDetector = playerInputManager.GetComponentInChildren<MotionGestureDetector>();
            if (gestureDetector == null)
            {
                GameObject gestureGO = new GameObject("Motion Gesture Detector");
                gestureDetector = gestureGO.AddComponent<MotionGestureDetector>();
                gestureGO.transform.SetParent(playerInputManager.transform);
            }
            
            // Check for Gamepad Input Accessory
            GamepadInputAccessory gamepadAccessory = playerInputManager.GetComponentInChildren<GamepadInputAccessory>();
            if (gamepadAccessory == null)
            {
                GameObject gamepadGO = new GameObject("Gamepad Input Accessory");
                gamepadAccessory = gamepadGO.AddComponent<GamepadInputAccessory>();
                gamepadGO.transform.SetParent(playerInputManager.transform);
            }
            
            // Check for Controller Visualization
            ControllerVisualization controllerViz = playerInputManager.GetComponentInChildren<ControllerVisualization>();
            if (controllerViz == null)
            {
                GameObject vizGO = new GameObject("Controller Visualization");
                controllerViz = vizGO.AddComponent<ControllerVisualization>();
                vizGO.transform.SetParent(playerInputManager.transform);
            }
            
            Debug.Log("Ensured all input components are present");
        }
        
        private void SetupUICanvas()
        {
            if (uiCanvas == null)
            {
                uiCanvas = FindObjectOfType<Canvas>();
            }
            
            if (uiCanvas == null)
            {
                GameObject canvasGO = new GameObject("UI Canvas");
                uiCanvas = canvasGO.AddComponent<Canvas>();
                uiCanvas.renderMode = RenderMode.ScreenSpaceOverlay;
                
                // Add Canvas Scaler
                var canvasScaler = canvasGO.AddComponent<UnityEngine.UI.CanvasScaler>();
                canvasScaler.uiScaleMode = UnityEngine.UI.CanvasScaler.ScaleMode.ScaleWithScreenSize;
                canvasScaler.referenceResolution = new Vector2(1920, 1080);
                
                // Add Graphics Raycaster
                canvasGO.AddComponent<UnityEngine.UI.GraphicRaycaster>();
                
                canvasGO.transform.SetParent(transform);
                
                Debug.Log("Created UI Canvas");
            }
        }
        
        private void SetupControlAccessoriesUI()
        {
            if (uiCanvas == null) return;
            
            // Check if Control Accessories UI already exists
            ControlAccessoriesUI existingUI = FindObjectOfType<ControlAccessoriesUI>();
            if (existingUI != null)
            {
                Debug.Log("Control Accessories UI already exists");
                return;
            }
            
            GameObject uiGO;
            
            // Try to instantiate from prefab if available
            if (controlAccessoriesUIPrefab != null)
            {
                uiGO = Instantiate(controlAccessoriesUIPrefab, uiCanvas.transform);
                Debug.Log("Instantiated Control Accessories UI from prefab");
            }
            else
            {
                // Create basic UI structure
                uiGO = CreateBasicControlAccessoriesUI();
                Debug.Log("Created basic Control Accessories UI");
            }
            
            // Ensure the UI component is attached
            ControlAccessoriesUI controlUI = uiGO.GetComponent<ControlAccessoriesUI>();
            if (controlUI == null)
            {
                controlUI = uiGO.AddComponent<ControlAccessoriesUI>();
            }
        }
        
        private GameObject CreateBasicControlAccessoriesUI()
        {
            // Create main panel
            GameObject panelGO = new GameObject("Control Accessories Panel");
            panelGO.transform.SetParent(uiCanvas.transform, false);
            
            // Add RectTransform
            RectTransform rectTransform = panelGO.AddComponent<RectTransform>();
            rectTransform.anchorMin = new Vector2(0.1f, 0.1f);
            rectTransform.anchorMax = new Vector2(0.9f, 0.9f);
            rectTransform.offsetMin = Vector2.zero;
            rectTransform.offsetMax = Vector2.zero;
            
            // Add background image
            var image = panelGO.AddComponent<UnityEngine.UI.Image>();
            image.color = new Color(0.1f, 0.1f, 0.1f, 0.8f);
            
            // Initially hide the panel
            panelGO.SetActive(false);
            
            return panelGO;
        }
        
        private void ApplyDefaultSettings()
        {
            // Apply default motion sensitivity
            BowlingBall bowlingBall = FindObjectOfType<BowlingBall>();
            if (bowlingBall != null)
            {
                bowlingBall.SetMotionSensitivity(defaultMotionSensitivity);
            }
            
            // Apply default gamepad sensitivity
            GamepadInputAccessory gamepadAccessory = FindObjectOfType<GamepadInputAccessory>();
            if (gamepadAccessory != null)
            {
                gamepadAccessory.SetGamepadSensitivity(defaultGamepadSensitivity);
            }
            
            // Apply default DSU configuration
            DSUConfiguration dsuConfig = Resources.Load<DSUConfiguration>("DSU Configuration");
            if (dsuConfig != null)
            {
                dsuConfig.serverIP = defaultServerIP;
                dsuConfig.serverPort = defaultServerPort;
                dsuConfig.motionSensitivity = defaultMotionSensitivity;
            }
            
            Debug.Log("Applied default settings");
        }
        
        // Public methods for manual setup
        public void EnableDebugMode(bool enable)
        {
            enableDebugMode = enable;
            
            if (playerInputManager != null)
            {
                // Enable debug mode on input manager if it has such a property
                // This would need to be implemented in PlayerInputManager
            }
            
            DSUConfiguration dsuConfig = Resources.Load<DSUConfiguration>("DSU Configuration");
            if (dsuConfig != null)
            {
                dsuConfig.debugLogging = enable;
            }
        }
        
        public void SetMotionSensitivity(float sensitivity)
        {
            defaultMotionSensitivity = sensitivity;
            
            BowlingBall bowlingBall = FindObjectOfType<BowlingBall>();
            if (bowlingBall != null)
            {
                bowlingBall.SetMotionSensitivity(sensitivity);
            }
        }
        
        public void SetGamepadSensitivity(float sensitivity)
        {
            defaultGamepadSensitivity = sensitivity;
            
            GamepadInputAccessory gamepadAccessory = FindObjectOfType<GamepadInputAccessory>();
            if (gamepadAccessory != null)
            {
                gamepadAccessory.SetGamepadSensitivity(sensitivity);
            }
        }
        
        public void SetDSUServerSettings(string ip, int port)
        {
            defaultServerIP = ip;
            defaultServerPort = port;
            
            DSUConfiguration dsuConfig = Resources.Load<DSUConfiguration>("DSU Configuration");
            if (dsuConfig != null)
            {
                dsuConfig.serverIP = ip;
                dsuConfig.serverPort = port;
            }
        }
        
        // Validation method
        public bool ValidateSetup()
        {
            bool isValid = true;
            
            if (playerInputManager == null)
            {
                Debug.LogWarning("PlayerInputManager not found");
                isValid = false;
            }
            
            if (FindObjectOfType<DSUClient>() == null)
            {
                Debug.LogWarning("DSUClient not found");
                isValid = false;
            }
            
            if (FindObjectOfType<GamepadInputAccessory>() == null)
            {
                Debug.LogWarning("GamepadInputAccessory not found");
                isValid = false;
            }
            
            if (FindObjectOfType<ControllerVisualization>() == null)
            {
                Debug.LogWarning("ControllerVisualization not found");
                isValid = false;
            }
            
            if (createUICanvas && uiCanvas == null)
            {
                Debug.LogWarning("UI Canvas not found");
                isValid = false;
            }
            
            return isValid;
        }
        
        // Context menu methods for testing
        [ContextMenu("Validate Setup")]
        private void TestValidateSetup()
        {
            bool isValid = ValidateSetup();
            Debug.Log($"Setup validation: {(isValid ? "PASSED" : "FAILED")}");
        }
        
        [ContextMenu("Enable Debug Mode")]
        private void TestEnableDebugMode()
        {
            EnableDebugMode(true);
            Debug.Log("Debug mode enabled");
        }
        
        [ContextMenu("Reset to Defaults")]
        private void TestResetToDefaults()
        {
            ApplyDefaultSettings();
            Debug.Log("Reset to default settings");
        }
    }
}