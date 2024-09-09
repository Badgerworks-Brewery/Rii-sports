using UnityEngine;
using UnityEngine.AI;

public class AI : MonoBehaviour
{
    private GameObject target;
    private NavMeshAgent navmesh;

    private void Start()
    {
        navmesh = GetComponent<NavMeshAgent>();
    }

    public void SetTarget(GameObject newTarget)
    {
        target = newTarget;
    }

    public void Move()
    {
        if (target != null)
        {
            Debug.Log($"Target set for AI: {target.name}");
            navmesh.destination = target.transform.position;
        }
        else
        {
            Debug.LogWarning($"Target is not set for AI: {target.name}");
        }
    }
}