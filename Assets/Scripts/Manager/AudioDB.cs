using FMOD.Studio;
using FMODUnity;
using UnityEngine;

public class AudioDB : MonoBehaviour
{
    public static EventInstance themeMusic = RuntimeManager.CreateInstance("event:/music/theme");
    public static EventInstance miiMaker = RuntimeManager.CreateInstance("event:/music/miiMaker");
}
