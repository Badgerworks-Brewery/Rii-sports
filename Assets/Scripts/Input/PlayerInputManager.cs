using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInputManager : MonoBehaviour
{
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            PlayerHit();
        }
    }

    private void PlayerHit()
    {

        EventDB.TriggerPlayerHit();
    }
}
