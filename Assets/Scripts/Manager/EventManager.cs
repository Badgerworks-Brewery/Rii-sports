using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class EventManager : MonoBehaviour
{
    public static AI[] agents;
    public static GameObject target;
    public static GameObject bowlingBall;

    private void Awake()
    {
        agents = FindObjectsByType<AI>(FindObjectsSortMode.None);
        bowlingBall = GameObject.FindGameObjectWithTag("Ball");
    }

    private void OnEnable()
    {
        EventDB.OnPlayerHit += HandlePlayerHit;
    }

    private void OnDisable()
    {
        EventDB.OnPlayerHit -= HandlePlayerHit;
    }

    void HandlePlayerHit()
    {
        Debug.Log("Player hit!");
        if(SceneManager.GetActiveScene().name == "Bowling"){
            CheckForBowlingBall();
            
            BowlingBall ballScript = bowlingBall.GetComponent<BowlingBall>();

            if (bowlingBall != null)
            {
                ballScript.ThrowBall();
            }
            else
            {
                Debug.LogWarning("BowlingBall component not found on " + bowlingBall.name);
            }
        }else{
            target = GameObject.Find("Target");

            if (target == null)
            {
                Debug.LogError("Target GameObject not found!");
                return;
            }
            
            foreach (AI agent in agents)
            {
                agent.SetTarget(target);
                agent.Move();
            }
        }
    }

    public void CheckForBowlingBall()
    {
        while (bowlingBall == null)
        {
            bowlingBall = GameObject.FindGameObjectWithTag("Ball");
            if (bowlingBall != null)
            {
                Debug.Log("Bowling ball found: " + bowlingBall.name);
            }
            else
            {
                Debug.Log("Bowling ball not found.");
            }
        }
    }
}
