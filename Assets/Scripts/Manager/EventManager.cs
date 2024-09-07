using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EventManager : MonoBehaviour
{
    public static AI[] agents;
    public static GameObject target;

    private void Awake()
    {
        agents = FindObjectsOfType<AI>();
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
        Debug.Log("Player was hit!");
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
