using UnityEngine;
using UnityEngine.InputSystem;
using System;

namespace RiiSports.Input
{
    /// <summary>
    /// Handles traditional gamepad input as an accessory to motion controls
    /// Provides button-based alternatives to motion gestures
    /// </summary>
    public class GamepadInputAccessory : MonoBehaviour
    {
        [Header("Gamepad Settings")]
        [SerializeField] private bool enableGamepadInput = true;
        [SerializeField] private float gamepadSensitivity = 1.0f;
        [SerializeField] private bool debugGamepadInput = false;
        
        [Header("Button Mapping")]
        [SerializeField] private InputActionReference throwAction;
        [SerializeField] private InputActionReference aimAction;
        [SerializeField] private InputActionReference powerAction;
        [SerializeField] private InputActionReference menuAction;
        
        [Header("Analog Controls")]
        [SerializeField] private InputActionReference leftStickAction;
        [SerializeField] private InputActionReference rightStickAction;
        [SerializeField] private InputActionReference triggersAction;
        
        // Events for gamepad input
        public System.Action<Vector3, float> OnGamepadThrow;
        public System.Action<Vector2> OnGamepadAim;
        public System.Action<float> OnGamepadPower;
        public System.Action OnGamepadMenu;
        
        // Current gamepad state
        private Vector2 currentAimInput;
        private float currentPowerInput;
        private bool isGamepadConnected = false;
        private Gamepad currentGamepad;
        
        // Throw mechanics
        private bool isChargingThrow = false;
        private float throwChargeTime = 0f;
        private const float maxChargeTime = 3f;
        
        private void OnEnable()
        {
            EnableInputActions();
            DetectGamepad();
        }
        
        private void OnDisable()
        {
            DisableInputActions();
        }
        
        private void Update()
        {
            UpdateGamepadStatus();
            HandleAnalogInputs();
            HandleThrowCharging();
        }
        
        private void EnableInputActions()
        {
            if (!enableGamepadInput) return;
            
            if (throwAction != null)
            {
                throwAction.action.Enable();
                throwAction.action.performed += OnThrowPerformed;
                throwAction.action.started += OnThrowStarted;
                throwAction.action.canceled += OnThrowCanceled;
            }
            
            if (aimAction != null)
            {
                aimAction.action.Enable();
            }
            
            if (powerAction != null)
            {
                powerAction.action.Enable();
            }
            
            if (menuAction != null)
            {
                menuAction.action.Enable();
                menuAction.action.performed += OnMenuPerformed;
            }
            
            if (leftStickAction != null)
                leftStickAction.action.Enable();
            
            if (rightStickAction != null)
                rightStickAction.action.Enable();
            
            if (triggersAction != null)
                triggersAction.action.Enable();
        }
        
        private void DisableInputActions()
        {
            if (throwAction != null)
            {
                throwAction.action.performed -= OnThrowPerformed;
                throwAction.action.started -= OnThrowStarted;
                throwAction.action.canceled -= OnThrowCanceled;
                throwAction.action.Disable();
            }
            
            if (aimAction != null)
                aimAction.action.Disable();
            
            if (powerAction != null)
                powerAction.action.Disable();
            
            if (menuAction != null)
            {
                menuAction.action.performed -= OnMenuPerformed;
                menuAction.action.Disable();
            }
            
            if (leftStickAction != null)
                leftStickAction.action.Disable();
            
            if (rightStickAction != null)
                rightStickAction.action.Disable();
            
            if (triggersAction != null)
                triggersAction.action.Disable();
        }
        
        private void DetectGamepad()
        {
            currentGamepad = Gamepad.current;
            isGamepadConnected = currentGamepad != null;
            
            if (debugGamepadInput)
            {
                Debug.Log($"Gamepad detection: {(isGamepadConnected ? "Connected" : "Not connected")}");
            }
        }
        
        private void UpdateGamepadStatus()
        {
            bool wasConnected = isGamepadConnected;
            DetectGamepad();
            
            if (wasConnected != isGamepadConnected && debugGamepadInput)
            {
                Debug.Log($"Gamepad status changed: {(isGamepadConnected ? "Connected" : "Disconnected")}");
            }
        }
        
        private void HandleAnalogInputs()
        {
            if (!enableGamepadInput || !isGamepadConnected) return;
            
            // Handle aiming with left stick
            if (leftStickAction != null)
            {
                Vector2 aimInput = leftStickAction.action.ReadValue<Vector2>();
                if (aimInput != currentAimInput)
                {
                    currentAimInput = aimInput * gamepadSensitivity;
                    OnGamepadAim?.Invoke(currentAimInput);
                    
                    if (debugGamepadInput && aimInput.magnitude > 0.1f)
                    {
                        Debug.Log($"Gamepad aim input: {currentAimInput}");
                    }
                }
            }
            
            // Handle power with right trigger
            if (triggersAction != null)
            {
                float powerInput = triggersAction.action.ReadValue<float>();
                if (Mathf.Abs(powerInput - currentPowerInput) > 0.01f)
                {
                    currentPowerInput = powerInput;
                    OnGamepadPower?.Invoke(currentPowerInput);
                    
                    if (debugGamepadInput && powerInput > 0.1f)
                    {
                        Debug.Log($"Gamepad power input: {currentPowerInput}");
                    }
                }
            }
        }
        
        private void HandleThrowCharging()
        {
            if (isChargingThrow)
            {
                throwChargeTime += Time.deltaTime;
                throwChargeTime = Mathf.Min(throwChargeTime, maxChargeTime);
                
                // Provide visual/audio feedback for charging (could be implemented later)
                float chargePercent = throwChargeTime / maxChargeTime;
                OnGamepadPower?.Invoke(chargePercent);
            }
        }
        
        private void OnThrowStarted(InputAction.CallbackContext context)
        {
            if (!enableGamepadInput) return;
            
            isChargingThrow = true;
            throwChargeTime = 0f;
            
            if (debugGamepadInput)
            {
                Debug.Log("Gamepad throw charging started");
            }
        }
        
        private void OnThrowPerformed(InputAction.CallbackContext context)
        {
            if (!enableGamepadInput) return;
            
            ExecuteGamepadThrow();
        }
        
        private void OnThrowCanceled(InputAction.CallbackContext context)
        {
            if (!enableGamepadInput) return;
            
            if (isChargingThrow)
            {
                ExecuteGamepadThrow();
            }
        }
        
        private void ExecuteGamepadThrow()
        {
            if (!isChargingThrow) return;
            
            isChargingThrow = false;
            
            // Calculate throw parameters based on charge time and aim
            float throwPower = (throwChargeTime / maxChargeTime) * gamepadSensitivity;
            Vector3 throwDirection = new Vector3(currentAimInput.x, 0, 1f);
            throwDirection = throwDirection.normalized;
            
            // Apply some randomness for more natural feel
            throwDirection.x += Random.Range(-0.1f, 0.1f) * (1f - throwPower);
            
            OnGamepadThrow?.Invoke(throwDirection, throwPower);
            
            if (debugGamepadInput)
            {
                Debug.Log($"Gamepad throw executed - Direction: {throwDirection}, Power: {throwPower}");
            }
            
            throwChargeTime = 0f;
        }
        
        private void OnMenuPerformed(InputAction.CallbackContext context)
        {
            if (!enableGamepadInput) return;
            
            OnGamepadMenu?.Invoke();
            
            if (debugGamepadInput)
            {
                Debug.Log("Gamepad menu button pressed");
            }
        }
        
        // Public methods for external control
        public void EnableGamepadInput(bool enable)
        {
            enableGamepadInput = enable;
            
            if (enable)
                EnableInputActions();
            else
                DisableInputActions();
        }
        
        public void SetGamepadSensitivity(float sensitivity)
        {
            gamepadSensitivity = Mathf.Clamp(sensitivity, 0.1f, 5.0f);
        }
        
        public bool IsGamepadConnected => isGamepadConnected;
        public Vector2 GetCurrentAimInput() => currentAimInput;
        public float GetCurrentPowerInput() => currentPowerInput;
        public bool IsChargingThrow => isChargingThrow;
        public float GetThrowChargePercent() => throwChargeTime / maxChargeTime;
        
        // Haptic feedback methods (for supported gamepads)
        public void TriggerHapticFeedback(float lowFrequency = 0.5f, float highFrequency = 0.5f, float duration = 0.2f)
        {
            if (currentGamepad != null)
            {
                currentGamepad.SetMotorSpeeds(lowFrequency, highFrequency);
                
                // Stop haptic feedback after duration
                Invoke(nameof(StopHapticFeedback), duration);
            }
        }
        
        private void StopHapticFeedback()
        {
            if (currentGamepad != null)
            {
                currentGamepad.SetMotorSpeeds(0f, 0f);
            }
        }
        
        private void OnDestroy()
        {
            StopHapticFeedback();
        }
    }
}