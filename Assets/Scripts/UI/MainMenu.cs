using System.Collections;
using UnityEngine;
using UnityEngine.AddressableAssets;
using UnityEngine.ResourceManagement.AsyncOperations;
using UnityEngine.ResourceManagement.ResourceProviders;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;
using STOP_MODE = FMOD.Studio.STOP_MODE;

public class MainMenu : MonoBehaviour
{
    public GameObject mainMenu;
    public GameObject loadingScreen;
    public TMP_Text percentage;
    public Image progressBar;

    private void Start()
    {
        AudioDB.themeMusic.start();
    }

    public void Play(string scene)
    {
        AudioDB.themeMusic.stop(STOP_MODE.IMMEDIATE);
        mainMenu.SetActive(false);
        loadingScreen.SetActive(true);
        StartCoroutine(LoadSceneAsync(scene));
    }

    //TODO: settings menu
    public void Settings(){}

    //TODO: DLC system 
    public void Dlcs(){}

    public void Quit()
    {
        Application.Quit();
    }

    private IEnumerator LoadSceneAsync(string address)
    {
        AsyncOperationHandle<SceneInstance> handle = Addressables.LoadSceneAsync(address, LoadSceneMode.Single);

        while (!handle.IsDone)
        {
            float progress = handle.PercentComplete;
            percentage.text = "Loading...";
            progressBar.fillAmount = progress;

            yield return null;
        }

        if (handle.Status == AsyncOperationStatus.Succeeded)
        {
            percentage.text = "Scene loaded successfully!";
            Debug.Log("Scene loaded successfully!");
        }
        else
        {
            percentage.text = "Failed to load scene.";
            Debug.LogError("Failed to load scene.");
        }
    }
}