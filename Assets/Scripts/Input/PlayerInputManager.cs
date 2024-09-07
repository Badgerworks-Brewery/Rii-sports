using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInputManager : MonoBehaviour
{
    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            PlayerHit();
        }
    }

    void PlayerHit()
    {
        EventDB.TriggerPlayerHit();
    }
}
