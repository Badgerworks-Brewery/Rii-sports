using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EventDB : MonoBehaviour
{
    public delegate void PlayerHitAction();

    public static event PlayerHitAction OnPlayerHit;

    public static void TriggerPlayerHit()
    {
        OnPlayerHit?.Invoke();
    }
}
