using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public GameObject pin;
    public GameObject ballObj;

    private bool isBowling = false;
    private HashSet<Vector3>[] pinPlaces;
    private GameObject[] pins;

    private void Awake() {
        string sceneName = SceneManager.GetActiveScene().name;
        Debug.Log("Current scene name: " + sceneName);

        if (sceneName == "Bowling")
        {
            isBowling = true;
        }


        if(isBowling){
            pinPlaces = new HashSet<Vector3>[]{
                //player initial lane
                //1st row
                new HashSet<Vector3> { new Vector3(0.02755272f, 0.5f, -182.8984f) },
                //2nd row
                new HashSet<Vector3> { 
                    new Vector3(-1.532f, 0.5f, -185.548f), 
                    new Vector3(1.53f, 0.5f, -185.5f) 
                },
                //3rd row
                new HashSet<Vector3> {
                    new Vector3(-3.03f, 0.5f, -188.185f),
                    new Vector3(0.02f, 0.5f, -188.185f),
                    new Vector3(3.025f, 0.5f, -188.185f)
                },
                //4th row
                new HashSet<Vector3> {
                    new Vector3(-4.59f, 0.5f, -190.834f),
                    new Vector3(-1.526f, 0.5f, -190.834f),
                    new Vector3(1.531f, 0.5f, -190.834f),
                    new Vector3(4.62f, 0.5f, -190.834f)
                }
            };
        }
    }
    
    private void Start(){
        if(isBowling){
            InstantiatePins();

            pins = GameObject.FindGameObjectsWithTag("Pin");
            Debug.Log($"Found {pins.Length} pins");
        }
    }

    private void Update(){
        if(isBowling){
            if(Input.GetKeyDown(KeyCode.R))
                ResetPins();

            if(Input.GetKeyDown(KeyCode.Escape))
                SceneManager.LoadScene("MainMenu");
        }
    }

    private void InstantiatePins(){
        foreach (var set in pinPlaces)
        {
            foreach (var value in set)
            {
                Debug.Log($"Instantiating pin at: {value}");
                Instantiate(pin, value, Quaternion.identity);
            }
        }
    }

    private void ResetPins(){
        foreach (GameObject pin in pins)
        {
            BowlingPin bowlingPin = pin.GetComponent<BowlingPin>();

            if (bowlingPin != null)
            {
                Debug.Log("Resetting pin");
                bowlingPin.ResetPin();
            }
            else
            {
                Debug.LogWarning("BowlingPin component not found on " + pin.name);
            }
            ResetBall();
        }
    }

    public void ResetBall(){
        BowlingBall ball = GameObject.FindWithTag("Ball").GetComponent<BowlingBall>();

        Debug.Log("Resetting ball");
        ball.ResetBall();
    }
}
