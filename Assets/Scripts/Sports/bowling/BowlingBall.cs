using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BowlingBall : MonoBehaviour
{
    public GameObject gameManagerObj;
    public float throwForce = 500f;

    private Rigidbody rb;
    private Vector3 initialPosition;
    private Quaternion initialRotation;

    private void Awake()
    {
        if(gameObject.GetComponent<Rigidbody>() != null){
            rb = GetComponent<Rigidbody>();
        }else{
            rb = gameObject.AddComponent<Rigidbody>();
        }

        gameManagerObj = GameObject.FindGameObjectWithTag("GameManager");
    }

    private void Start() {
        initialPosition = transform.position;
        initialRotation = transform.rotation;
    }

    public void ThrowBall()
    {
        rb.AddForce(transform.forward * throwForce);
    }

    public void ResetBall()
    {
        rb.isKinematic = true;

        transform.position = initialPosition;
        transform.rotation = initialRotation;

        rb.isKinematic = false;
        rb.linearVelocity = Vector3.zero;
        rb.angularVelocity = Vector3.zero;
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
}
