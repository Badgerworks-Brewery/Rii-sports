using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BowlingPin : MonoBehaviour
{
    private Vector3 initialPosition;
    private Quaternion initialRotation;
    private Rigidbody rb;

    private void Awake() {
        rb = GetComponent<Rigidbody>();
        if (rb == null)
        {
            rb = gameObject.AddComponent<Rigidbody>();
        }
    }

    private void Start()
    {
        initialPosition = transform.position;
        initialRotation = transform.rotation;
    }

    public void ResetPin()
    {
        rb.isKinematic = true;

        transform.position = initialPosition;
        transform.rotation = initialRotation;

        rb.isKinematic = false;
        rb.velocity = Vector3.zero;
        rb.angularVelocity = Vector3.zero;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("PinPlace"))
        {
            Vector3 pos = transform.position;
            pos.y = Mathf.Max(pos.y, collision.contacts[0].point.y + 0.1f);
            transform.position = pos;
        }
    }
}
