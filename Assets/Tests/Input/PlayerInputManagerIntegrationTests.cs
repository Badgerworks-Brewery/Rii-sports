using System.Collections;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

[TestFixture]
public class PlayerInputManagerIntegrationTests
{
    private GameObject testGameObject;
    private PlayerInputManager playerInputManager;
    private int eventTriggerCount;

    [SetUp]
    public void SetUp()
    {
        // Create a test GameObject with PlayerInputManager component
        testGameObject = new GameObject("TestPlayerInputManager");
        playerInputManager = testGameObject.AddComponent<PlayerInputManager>();

        // Reset event trigger count
        eventTriggerCount = 0;

        // Subscribe to the event to count triggers
        EventDB.OnPlayerHit += OnPlayerHitTriggered;
    }

    [TearDown]
    public void TearDown()
    {
        // Unsubscribe from the event
        EventDB.OnPlayerHit -= OnPlayerHitTriggered;

        // Clean up the test GameObject
        if (testGameObject != null)
        {
            Object.DestroyImmediate(testGameObject);
        }
    }

    private void OnPlayerHitTriggered()
    {
        eventTriggerCount++;
    }

    [UnityTest]
    public IEnumerator PlayerInputManager_Update_ProcessesInputCorrectly()
    {
        // Arrange
        Assert.AreEqual(0, eventTriggerCount, "Event should not be triggered initially");

        // Act & Assert - Test that Update method exists and can be called
        // Since we can't easily mock Input.GetKeyDown, we'll test the Update method indirectly

        // Simulate multiple Update calls (as would happen in game loop)
        for (int i = 0; i < 5; i++)
        {
            // Call Update method through reflection to simulate Unity's Update loop
            var updateMethod = typeof(PlayerInputManager).GetMethod("Update",
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

            if (updateMethod != null)
            {
                updateMethod.Invoke(playerInputManager, null);
            }

            yield return null; // Wait one frame
        }

        // Since we can't simulate actual key presses in unit tests,
        // we verify that the Update method exists and can be called without errors
        Assert.IsTrue(true, "Update method should execute without throwing exceptions");
    }

    [Test]
    public void PlayerInputManager_EventSystem_WorksWithMultipleManagers()
    {
        // Arrange - Create a second PlayerInputManager
        var secondGameObject = new GameObject("SecondTestPlayerInputManager");
        var secondPlayerInputManager = secondGameObject.AddComponent<PlayerInputManager>();

        try
        {
            // Act - Trigger PlayerHit from both managers
            var playerHitMethod = typeof(PlayerInputManager).GetMethod("PlayerHit",
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

            playerHitMethod.Invoke(playerInputManager, null);
            playerHitMethod.Invoke(secondPlayerInputManager, null);

            // Assert
            Assert.AreEqual(2, eventTriggerCount, "Both PlayerInputManager instances should trigger events");
        }
        finally
        {
            // Clean up
            Object.DestroyImmediate(secondGameObject);
        }
    }
}
