using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RiiSports.Input;

public class BowlingBall : MonoBehaviour
{
    [Header("Ball Settings")]
    public GameObject gameManagerObj;
    public float throwForce = 500f;
    public float motionForceMultiplier = 200f;
    public float maxThrowForce = 1500f;
    public float minThrowForce = 100f;
    
    [Header("Motion Control")]
    [SerializeField] private bool useMotionControls = true;
    [SerializeField] private float motionSensitivity = 1.0f;
    [SerializeField] private AnimationCurve forceResponseCurve = AnimationCurve.EaseInOut(0, 0, 1, 1);
    
    private Rigidbody rb;
    private Vector3 initialPosition;
    private Quaternion initialRotation;
    private PlayerInputManager inputManager;
    
    // Motion throw data
    private Vector3 motionThrowDirection = Vector3.forward;
    private float motionThrowForce = 1.0f;
    private bool hasMotionData = false;

    private void Awake()
    {
        if(gameObject.GetComponent<Rigidbody>() != null){
            rb = GetComponent<Rigidbody>();
        }else{
            rb = gameObject.AddComponent<Rigidbody>();
        }

        gameManagerObj = GameObject.FindGameObjectWithTag("GameManager");
        
        // Find input manager
        inputManager = FindObjectOfType<PlayerInputManager>();
    }

    private void Start() 
    {
        initialPosition = transform.position;
        initialRotation = transform.rotation;
        
        // Subscribe to motion input events
        if (inputManager != null && useMotionControls)
        {
            inputManager.OnMotionThrow += HandleMotionThrow;
        }
    }
    
    private void OnDestroy()
    {
        // Unsubscribe from events
        if (inputManager != null)
        {
            inputManager.OnMotionThrow -= HandleMotionThrow;
        }
    }
    
    private void HandleMotionThrow(Vector3 direction, float force)
    {
        motionThrowDirection = direction;
        motionThrowForce = force;
        hasMotionData = true;
        
        Debug.Log($"Motion throw data received - Direction: {direction}, Force: {force}");
    }

    public void ThrowBall()
    {
        if (useMotionControls && hasMotionData && inputManager != null && inputManager.IsMotionControlsActive)
        {
            ThrowBallWithMotion();
        }
        else
        {
            ThrowBallTraditional();
        }
    }
    
    private void ThrowBallWithMotion()
    {
        // Calculate throw force based on motion data
        float calculatedForce = Mathf.Clamp(
            motionThrowForce * motionForceMultiplier * motionSensitivity,
            minThrowForce,
            maxThrowForce
        );
        
        // Apply force response curve for more natural feel
        float normalizedForce = (calculatedForce - minThrowForce) / (maxThrowForce - minThrowForce);
        float curvedForce = forceResponseCurve.Evaluate(normalizedForce);
        calculatedForce = Mathf.Lerp(minThrowForce, maxThrowForce, curvedForce);
        
        // Calculate throw direction
        Vector3 throwDirection = CalculateThrowDirection();
        
        // Apply force to ball
        rb.AddForce(throwDirection * calculatedForce);
        
        // Add some spin based on motion direction
        Vector3 spin = Vector3.Cross(throwDirection, Vector3.up) * motionThrowForce * 0.5f;
        rb.AddTorque(spin);
        
        // Reset motion data
        hasMotionData = false;
        
        Debug.Log($"Ball thrown with motion - Force: {calculatedForce}, Direction: {throwDirection}");
    }
    
    private void ThrowBallTraditional()
    {
        rb.AddForce(transform.forward * throwForce);
        Debug.Log($"Ball thrown traditionally - Force: {throwForce}");
    }
    
    private Vector3 CalculateThrowDirection()
    {
        // Base direction is forward
        Vector3 baseDirection = transform.forward;
        
        // Apply motion direction influence
        Vector3 motionInfluence = new Vector3(
            motionThrowDirection.x * motionSensitivity,
            0f, // Keep Y at 0 for bowling
            motionThrowDirection.z
        );
        
        // Combine base direction with motion influence
        Vector3 finalDirection = (baseDirection + motionInfluence).normalized;
        
        // Ensure the ball doesn't go backwards or too far sideways
        finalDirection.z = Mathf.Max(finalDirection.z, 0.5f);
        finalDirection.x = Mathf.Clamp(finalDirection.x, -0.5f, 0.5f);
        
        return finalDirection.normalized;
    }

    public void ResetBall()
    {
        rb.isKinematic = true;

        transform.position = initialPosition;
        transform.rotation = initialRotation;

        rb.isKinematic = false;
        rb.linearVelocity = Vector3.zero;
        rb.angularVelocity = Vector3.zero;
        
        // Reset motion data
        hasMotionData = false;
        motionThrowDirection = Vector3.forward;
        motionThrowForce = 1.0f;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Lane"))
        {
            Vector3 pos = transform.position;
            pos.y = Mathf.Max(pos.y, collision.contacts[0].point.y + 0.5f);
            transform.position = pos;
        }else if(collision.gameObject.CompareTag("EOL")){
            GameManager gameManager = gameManagerObj.GetComponent<GameManager>();

            gameManager.ResetBall();
        }
    }
    
    // Public methods for configuration
    public void SetMotionControlsEnabled(bool enabled)
    {
        useMotionControls = enabled;
    }
    
    public void SetMotionSensitivity(float sensitivity)
    {
        motionSensitivity = Mathf.Clamp(sensitivity, 0.1f, 3.0f);
    }
    
    // Public getters for debugging
    public bool HasMotionData => hasMotionData;
    public Vector3 GetMotionThrowDirection() => motionThrowDirection;
    public float GetMotionThrowForce() => motionThrowForce;
    public bool IsUsingMotionControls => useMotionControls && inputManager != null && inputManager.IsMotionControlsActive;
}
