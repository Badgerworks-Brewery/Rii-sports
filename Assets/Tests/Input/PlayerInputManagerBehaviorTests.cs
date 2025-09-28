using System.Collections;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

/// <summary>
/// Behavioral tests for PlayerInputManager focusing on expected outcomes rather than implementation details
/// </summary>
[TestFixture]
public class PlayerInputManagerBehaviorTests
{
    private GameObject testGameObject;
    private PlayerInputManager playerInputManager;
    private TestEventListener eventListener;

    [SetUp]
    public void SetUp()
    {
        // Create test environment
        testGameObject = new GameObject("TestPlayerInputManager");
        playerInputManager = testGameObject.AddComponent<PlayerInputManager>();
        eventListener = new TestEventListener();

        // Subscribe to events
        EventDB.OnPlayerHit += eventListener.OnPlayerHit;
    }

    [TearDown]
    public void TearDown()
    {
        // Clean up event subscriptions
        if (eventListener != null)
        {
            EventDB.OnPlayerHit -= eventListener.OnPlayerHit;
        }

        // Clean up test objects
        if (testGameObject != null)
        {
            Object.DestroyImmediate(testGameObject);
        }
    }

    [Test]
    public void WhenPlayerInputManagerExists_ShouldBeMonoBehaviour()
    {
        // Assert
        Assert.IsNotNull(playerInputManager);
        Assert.IsInstanceOf<MonoBehaviour>(playerInputManager);
    }

    [Test]
    public void WhenPlayerHitIsTriggered_ShouldNotifyEventListeners()
    {
        // Arrange
        Assert.AreEqual(0, eventListener.PlayerHitCount, "Initial state should have no events");

        // Act - Simulate the behavior that would occur when space is pressed
        TriggerPlayerHitBehavior();

        // Assert
        Assert.AreEqual(1, eventListener.PlayerHitCount, "Event listener should receive exactly one event");
        Assert.IsTrue(eventListener.WasPlayerHitCalled, "PlayerHit event should have been triggered");
    }

    [Test]
    public void WhenPlayerHitIsTriggeredMultipleTimes_ShouldNotifyForEachTrigger()
    {
        // Arrange
        const int expectedTriggers = 3;

        // Act
        for (int i = 0; i < expectedTriggers; i++)
        {
            TriggerPlayerHitBehavior();
        }

        // Assert
        Assert.AreEqual(expectedTriggers, eventListener.PlayerHitCount,
            $"Should receive {expectedTriggers} events");
    }

    [Test]
    public void WhenMultipleListenersSubscribed_ShouldNotifyAllListeners()
    {
        // Arrange
        var secondListener = new TestEventListener();
        EventDB.OnPlayerHit += secondListener.OnPlayerHit;

        try
        {
            // Act
            TriggerPlayerHitBehavior();

            // Assert
            Assert.AreEqual(1, eventListener.PlayerHitCount, "First listener should receive event");
            Assert.AreEqual(1, secondListener.PlayerHitCount, "Second listener should receive event");
        }
        finally
        {
            EventDB.OnPlayerHit -= secondListener.OnPlayerHit;
        }
    }

    /// <summary>
    /// Helper method to trigger the PlayerHit behavior without relying on implementation details
    /// </summary>
    private void TriggerPlayerHitBehavior()
    {
        // Use reflection to call the private PlayerHit method, simulating the behavior
        // that would occur when the space key is pressed
        var playerHitMethod = typeof(PlayerInputManager).GetMethod("PlayerHit",
            System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

        Assert.IsNotNull(playerHitMethod, "PlayerHit method should exist");
        playerHitMethod.Invoke(playerInputManager, null);
    }
}

/// <summary>
/// Test helper class to track event notifications
/// </summary>
public class TestEventListener
{
    public int PlayerHitCount { get; private set; }
    public bool WasPlayerHitCalled => PlayerHitCount > 0;

    public void OnPlayerHit()
    {
        PlayerHitCount++;
    }

    public void Reset()
    {
        PlayerHitCount = 0;
    }
}
