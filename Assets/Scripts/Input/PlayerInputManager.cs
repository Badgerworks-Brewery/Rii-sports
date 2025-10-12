using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RiiSports.Input;

public class PlayerInputManager : MonoBehaviour
{
    [Header("Input Settings")]
    [SerializeField] private bool enableMotionControls = true;
    [SerializeField] private bool enableKeyboardControls = true;
    [SerializeField] private bool debugInput = false;
    
    [Header("Motion Control Components")]
    [SerializeField] private DSUClient dsuClient;
    [SerializeField] private MotionGestureDetector gestureDetector;
    
    [Header("Control Accessories")]
    [SerializeField] private GamepadInputAccessory gamepadAccessory;
    [SerializeField] private ControllerVisualization controllerVisualization;
    
    [Header("Bowling Settings")]
    [SerializeField] private float motionThrowForceMultiplier = 1.0f;
    [SerializeField] private Vector3 motionThrowDirection = Vector3.forward;
    
    // Current input state
    private bool motionControlsActive = false;
    private DSUMotionData currentMotionData;
    
    // Events for motion input
    public System.Action<Vector3, float> OnMotionThrow;
    public System.Action<MotionGestureEvent> OnMotionGesture;
    
    private void Start()
    {
        InitializeMotionControls();
    }
    
    private void Update()
    {
        HandleKeyboardInput();
        UpdateMotionControlStatus();
    }
    
    private void InitializeMotionControls()
    {
        if (!enableMotionControls) return;
        
        // Find or create DSU client
        if (dsuClient == null)
        {
            dsuClient = FindObjectOfType<DSUClient>();
            if (dsuClient == null)
            {
                GameObject dsuGO = new GameObject("DSU Client");
                dsuClient = dsuGO.AddComponent<DSUClient>();
                dsuGO.transform.SetParent(transform);
            }
        }
        
        // Find or create gesture detector
        if (gestureDetector == null)
        {
            gestureDetector = FindObjectOfType<MotionGestureDetector>();
            if (gestureDetector == null)
            {
                GameObject gestureGO = new GameObject("Motion Gesture Detector");
                gestureDetector = gestureGO.AddComponent<MotionGestureDetector>();
                gestureGO.transform.SetParent(transform);
            }
        }
        
        // Initialize control accessories
        InitializeControlAccessories();
        
        // Subscribe to events
        if (dsuClient != null)
        {
            dsuClient.OnMotionDataReceived += HandleMotionData;
            dsuClient.OnConnected += OnMotionControlsConnected;
            dsuClient.OnDisconnected += OnMotionControlsDisconnected;
        }
        
        if (gestureDetector != null)
        {
            gestureDetector.OnGestureDetected += HandleGestureDetected;
            gestureDetector.OnBowlingSwingDetected += HandleBowlingSwing;
        }
        
        if (debugInput)
            Debug.Log("Motion controls initialized");
    }
    
    private void InitializeControlAccessories()
    {
        // Find or create gamepad accessory
        if (gamepadAccessory == null)
        {
            gamepadAccessory = FindObjectOfType<GamepadInputAccessory>();
            if (gamepadAccessory == null)
            {
                GameObject gamepadGO = new GameObject("Gamepad Input Accessory");
                gamepadAccessory = gamepadGO.AddComponent<GamepadInputAccessory>();
                gamepadGO.transform.SetParent(transform);
            }
        }
        
        // Find or create controller visualization
        if (controllerVisualization == null)
        {
            controllerVisualization = FindObjectOfType<ControllerVisualization>();
            if (controllerVisualization == null)
            {
                GameObject visualGO = new GameObject("Controller Visualization");
                controllerVisualization = visualGO.AddComponent<ControllerVisualization>();
                visualGO.transform.SetParent(transform);
            }
        }
        
        // Subscribe to gamepad events
        if (gamepadAccessory != null)
        {
            gamepadAccessory.OnGamepadThrow += HandleGamepadThrow;
            gamepadAccessory.OnGamepadAim += HandleGamepadAim;
            gamepadAccessory.OnGamepadPower += HandleGamepadPower;
            gamepadAccessory.OnGamepadMenu += HandleGamepadMenu;
        }
        
        if (debugInput)
            Debug.Log("Control accessories initialized");
    }
    
    private void HandleKeyboardInput()
    {
        if (!enableKeyboardControls) return;
        
        if (Input.GetKeyDown(KeyCode.Space))
        {
            PlayerHit();
        }
        
        // Additional keyboard controls for testing
        if (debugInput)
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                TestThrow();
            }
            
            if (Input.GetKeyDown(KeyCode.R))
            {
                ResetMotionControls();
            }
        }
    }
    
    private void HandleMotionData(DSUMotionData motionData)
    {
        currentMotionData = motionData;
        
        // Pass motion data to gesture detector
        if (gestureDetector != null)
        {
            gestureDetector.ProcessMotionData(motionData);
        }
        
        if (debugInput)
        {
            Debug.Log($"Motion Data - Accel: {motionData.accelerometer}, Gyro: {motionData.gyroscope}");
        }
    }
    
    private void HandleGestureDetected(MotionGestureEvent gestureEvent)
    {
        if (debugInput)
            Debug.Log($"Gesture Detected: {gestureEvent.gesture} - Intensity: {gestureEvent.intensity}");
        
        // Trigger appropriate game events based on gesture
        switch (gestureEvent.gesture)
        {
            case MotionGesture.SwingForward:
                PlayerHit();
                break;
            case MotionGesture.Shake:
                // Could be used for other interactions
                break;
        }
        
        // Notify subscribers
        OnMotionGesture?.Invoke(gestureEvent);
    }
    
    private void HandleBowlingSwing(Vector3 direction, float force)
    {
        if (debugInput)
            Debug.Log($"Bowling Swing - Direction: {direction}, Force: {force}");
        
        // Calculate throw parameters
        Vector3 throwDirection = direction * motionThrowForceMultiplier;
        float throwForce = force * motionThrowForceMultiplier;
        
        // Trigger bowling throw
        TriggerMotionThrow(throwDirection, throwForce);
        
        // Also trigger general player hit for compatibility
        PlayerHit();
    }
    
    private void TriggerMotionThrow(Vector3 direction, float force)
    {
        // Store motion throw data for other systems to use
        motionThrowDirection = direction;
        
        // Notify subscribers
        OnMotionThrow?.Invoke(direction, force);
        
        // Trigger event system
        EventDB.TriggerPlayerHit();
    }
    
    private void PlayerHit()
    {
        EventDB.TriggerPlayerHit();
        
        if (debugInput)
            Debug.Log("Player Hit triggered");
    }
    
    private void TestThrow()
    {
        // Test method for debugging
        Vector3 testDirection = new Vector3(Random.Range(-0.5f, 0.5f), 0, 1);
        float testForce = Random.Range(1f, 3f);
        
        TriggerMotionThrow(testDirection, testForce);
        
        if (debugInput)
            Debug.Log($"Test throw - Direction: {testDirection}, Force: {testForce}");
    }
    
    private void ResetMotionControls()
    {
        if (gestureDetector != null)
        {
            gestureDetector.ResetGestureState();
        }
        
        if (debugInput)
            Debug.Log("Motion controls reset");
    }
    
    private void UpdateMotionControlStatus()
    {
        bool wasActive = motionControlsActive;
        motionControlsActive = enableMotionControls && dsuClient != null && dsuClient.IsConnected;
        
        if (wasActive != motionControlsActive && debugInput)
        {
            Debug.Log($"Motion controls {(motionControlsActive ? "activated" : "deactivated")}");
        }
    }
    
    private void OnMotionControlsConnected()
    {
        if (debugInput)
            Debug.Log("Motion controls connected");
    }
    
    private void OnMotionControlsDisconnected()
    {
        if (debugInput)
            Debug.Log("Motion controls disconnected");
    }
    
    // Gamepad event handlers
    private void HandleGamepadThrow(Vector3 direction, float force)
    {
        if (debugInput)
            Debug.Log($"Gamepad throw - Direction: {direction}, Force: {force}");
        
        // Calculate throw parameters similar to motion controls
        Vector3 throwDirection = direction * motionThrowForceMultiplier;
        float throwForce = force * motionThrowForceMultiplier;
        
        // Trigger throw
        TriggerMotionThrow(throwDirection, throwForce);
        
        // Also trigger general player hit for compatibility
        PlayerHit();
    }
    
    private void HandleGamepadAim(Vector2 aimInput)
    {
        if (debugInput && aimInput.magnitude > 0.1f)
            Debug.Log($"Gamepad aim input: {aimInput}");
        
        // Store aim input for use in throw calculations
        // This could be used to modify throw direction
    }
    
    private void HandleGamepadPower(float powerInput)
    {
        if (debugInput && powerInput > 0.1f)
            Debug.Log($"Gamepad power input: {powerInput}");
        
        // Power input could be used for charge-based throwing mechanics
    }
    
    private void HandleGamepadMenu()
    {
        if (debugInput)
            Debug.Log("Gamepad menu button pressed");
        
        // Could trigger pause menu or settings
    }
    
    private void OnDestroy()
    {
        // Unsubscribe from events
        if (dsuClient != null)
        {
            dsuClient.OnMotionDataReceived -= HandleMotionData;
            dsuClient.OnConnected -= OnMotionControlsConnected;
            dsuClient.OnDisconnected -= OnMotionControlsDisconnected;
        }
        
        if (gestureDetector != null)
        {
            gestureDetector.OnGestureDetected -= HandleGestureDetected;
            gestureDetector.OnBowlingSwingDetected -= HandleBowlingSwing;
        }
        
        // Unsubscribe from gamepad events
        if (gamepadAccessory != null)
        {
            gamepadAccessory.OnGamepadThrow -= HandleGamepadThrow;
            gamepadAccessory.OnGamepadAim -= HandleGamepadAim;
            gamepadAccessory.OnGamepadPower -= HandleGamepadPower;
            gamepadAccessory.OnGamepadMenu -= HandleGamepadMenu;
        }
    }
    
    // Public getters for other systems
    public bool IsMotionControlsActive => motionControlsActive;
    public DSUMotionData GetCurrentMotionData() => currentMotionData;
    public Vector3 GetMotionThrowDirection() => motionThrowDirection;
    public bool IsMotionControlsEnabled => enableMotionControls;
    
    // Control accessories getters
    public GamepadInputAccessory GetGamepadAccessory() => gamepadAccessory;
    public ControllerVisualization GetControllerVisualization() => controllerVisualization;
    public bool IsGamepadConnected => gamepadAccessory != null && gamepadAccessory.IsGamepadConnected;
    
    // Public methods for external control
    public void EnableMotionControls(bool enable)
    {
        enableMotionControls = enable;
        if (!enable && dsuClient != null)
        {
            dsuClient.Disconnect();
        }
        else if (enable && dsuClient != null && !dsuClient.IsConnected)
        {
            dsuClient.Connect();
        }
    }
    
    public void EnableKeyboardControls(bool enable)
    {
        enableKeyboardControls = enable;
    }
}
