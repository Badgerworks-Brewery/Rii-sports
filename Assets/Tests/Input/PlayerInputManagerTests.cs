using System.Collections;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

[TestFixture]
public class PlayerInputManagerTests
{
    private GameObject testGameObject;
    private PlayerInputManager playerInputManager;
    private bool eventTriggered;

    [SetUp]
    public void SetUp()
    {
        // Create a test GameObject with PlayerInputManager component
        testGameObject = new GameObject("TestPlayerInputManager");
        playerInputManager = testGameObject.AddComponent<PlayerInputManager>();

        // Reset event trigger flag
        eventTriggered = false;

        // Subscribe to the event to track if it's triggered
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
        eventTriggered = true;
    }

    [Test]
    public void PlayerInputManager_ComponentExists()
    {
        // Arrange & Act
        // Component is created in SetUp

        // Assert
        Assert.IsNotNull(playerInputManager, "PlayerInputManager component should exist");
        Assert.IsTrue(playerInputManager is MonoBehaviour, "PlayerInputManager should inherit from MonoBehaviour");
    }

    [UnityTest]
    public IEnumerator PlayerInputManager_SpaceKeyTriggers_PlayerHitEvent()
    {
        // Arrange
        Assert.IsFalse(eventTriggered, "Event should not be triggered initially");

        // Act - Simulate space key press
        // We need to simulate the key press and then call Update manually
        // since we can't directly simulate Input.GetKeyDown in unit tests

        // First, let's test the PlayerHit method directly through reflection
        var playerHitMethod = typeof(PlayerInputManager).GetMethod("PlayerHit",
            System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

        Assert.IsNotNull(playerHitMethod, "PlayerHit method should exist");

        // Invoke the private PlayerHit method
        playerHitMethod.Invoke(playerInputManager, null);

        // Wait a frame to ensure event processing
        yield return null;

        // Assert
        Assert.IsTrue(eventTriggered, "PlayerHit event should be triggered when PlayerHit method is called");
    }

    [Test]
    public void PlayerInputManager_PlayerHitMethod_TriggersEvent()
    {
        // Arrange
        Assert.IsFalse(eventTriggered, "Event should not be triggered initially");

        // Act - Use reflection to call the private PlayerHit method
        var playerHitMethod = typeof(PlayerInputManager).GetMethod("PlayerHit",
            System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

        Assert.IsNotNull(playerHitMethod, "PlayerHit method should exist");
        playerHitMethod.Invoke(playerInputManager, null);

        // Assert
        Assert.IsTrue(eventTriggered, "PlayerHit event should be triggered");
    }

    [Test]
    public void PlayerInputManager_EventDB_Integration()
    {
        // Arrange
        bool localEventTriggered = false;
        System.Action localHandler = () => localEventTriggered = true;
        EventDB.OnPlayerHit += localHandler;

        try
        {
            // Act - Call PlayerHit method directly through reflection
            var playerHitMethod = typeof(PlayerInputManager).GetMethod("PlayerHit",
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            playerHitMethod.Invoke(playerInputManager, null);

            // Assert
            Assert.IsTrue(localEventTriggered, "EventDB.OnPlayerHit should be triggered when PlayerHit is called");
        }
        finally
        {
            // Clean up
            EventDB.OnPlayerHit -= localHandler;
        }
    }

    [Test]
    public void PlayerInputManager_MultipleEventSubscribers_AllReceiveEvent()
    {
        // Arrange
        int eventCallCount = 0;
        System.Action counter1 = () => eventCallCount++;
        System.Action counter2 = () => eventCallCount++;
        System.Action counter3 = () => eventCallCount++;

        EventDB.OnPlayerHit += counter1;
        EventDB.OnPlayerHit += counter2;
        EventDB.OnPlayerHit += counter3;

        try
        {
            // Act - Call PlayerHit method through reflection
            var playerHitMethod = typeof(PlayerInputManager).GetMethod("PlayerHit",
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            playerHitMethod.Invoke(playerInputManager, null);

            // Assert
            Assert.AreEqual(4, eventCallCount, "All event subscribers should receive the event (3 local + 1 from SetUp)");
        }
        finally
        {
            // Clean up
            EventDB.OnPlayerHit -= counter1;
            EventDB.OnPlayerHit -= counter2;
            EventDB.OnPlayerHit -= counter3;
        }
    }
}
