using System.Collections;
using UnityEngine;
using UnityEngine.AddressableAssets;
using UnityEngine.ResourceManagement.AsyncOperations;
using UnityEngine.ResourceManagement.ResourceProviders;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;

public class SceneLoader : MonoBehaviour
{
    public GameObject sportSelector;
    public GameObject loadingScreen;
    public TMP_Text percentage;
    public Image progressBar;

    public string sceneAddress = "Bowling";

    private IEnumerator LoadSceneAsync(string address)
    {
        AsyncOperationHandle<SceneInstance> handle = Addressables.LoadSceneAsync(address, LoadSceneMode.Single);

        while (!handle.IsDone)
        {
            float progress = handle.PercentComplete;
            percentage.text = $"Loading... {progress * 100:F2}%";
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

    public void OnPlayClicked(){
        sportSelector.SetActive(false);
        loadingScreen.SetActive(true);
        StartCoroutine(LoadSceneAsync(sceneAddress));
    }
}
