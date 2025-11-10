using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using UnityEngine;

namespace RiiSports.Integration.Network
{
    /// <summary>
    /// Online multiplayer integration for Wii Sports
    /// Based on wii-otn (Wii Online Tennis) architecture
    /// </summary>
    public class OnlineMultiplayer : MonoBehaviour
    {
        [Header("Network Configuration")]
        [SerializeField] private bool enableOnlinePlay = false;
        [SerializeField] private string serverAddress = "localhost";
        [SerializeField] private int serverPort = 7777;
        [SerializeField] private bool debugMode = false;

        [Header("Player Settings")]
        [SerializeField] private string playerName = "Player";
        [SerializeField] private int maxPlayers = 4;

        private static OnlineMultiplayer instance;
        public static OnlineMultiplayer Instance => instance;

        private bool isConnected = false;
        private List<NetworkPlayer> connectedPlayers = new List<NetworkPlayer>();
        private NetworkPlayer localPlayer;
        
        // UDP networking
        private UdpClient udpClient;
        private Thread receiveThread;
        private bool isReceiving = false;
        private Queue<byte[]> receivedPackets = new Queue<byte[]>();
        private object packetLock = new object();

        private void Awake()
        {
            if (instance != null && instance != this)
            {
                Destroy(gameObject);
                return;
            }
            instance = this;
            DontDestroyOnLoad(gameObject);
        }

        private void Start()
        {
            if (enableOnlinePlay)
            {
                InitializeNetworking();
            }
        }

        /// <summary>
        /// Initialize network system
        /// </summary>
        private void InitializeNetworking()
        {
            try
            {
                if (debugMode)
                {
                    Debug.Log("[Network] Initializing online multiplayer...");
                }

                localPlayer = new NetworkPlayer
                {
                    PlayerId = GeneratePlayerId(),
                    PlayerName = playerName,
                    IsLocal = true
                };

                if (debugMode)
                {
                    Debug.Log($"[Network] Local player initialized: {playerName} (ID: {localPlayer.PlayerId})");
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"[Network] Failed to initialize networking: {e.Message}");
                enableOnlinePlay = false;
            }
        }

        /// <summary>
        /// Connect to game server
        /// </summary>
        public void Connect()
        {
            if (!enableOnlinePlay)
            {
                Debug.LogWarning("[Network] Online play is disabled");
                return;
            }

            if (isConnected)
            {
                Debug.LogWarning("[Network] Already connected to server");
                return;
            }

            try
            {
                if (debugMode)
                {
                    Debug.Log($"[Network] Connecting to {serverAddress}:{serverPort}...");
                }

                // Initialize UDP client
                udpClient = new UdpClient();
                udpClient.Connect(serverAddress, serverPort);

                // Start receive thread
                isReceiving = true;
                receiveThread = new Thread(ReceiveData);
                receiveThread.IsBackground = true;
                receiveThread.Start();

                isConnected = true;

                // Send connection request
                SendConnectionRequest();

                if (debugMode)
                {
                    Debug.Log("[Network] Connected to server successfully");
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"[Network] Connection failed: {e.Message}");
                isConnected = false;
                CleanupNetworking();
            }
        }

        private void ReceiveData()
        {
            while (isReceiving)
            {
                try
                {
                    IPEndPoint remoteEndPoint = new IPEndPoint(IPAddress.Any, 0);
                    byte[] data = udpClient.Receive(ref remoteEndPoint);

                    lock (packetLock)
                    {
                        receivedPackets.Enqueue(data);
                    }
                }
                catch (SocketException)
                {
                    // Socket closed, exit thread
                    break;
                }
                catch (Exception e)
                {
                    if (isReceiving && debugMode)
                    {
                        Debug.LogError($"[Network] Receive error: {e.Message}");
                    }
                    break;
                }
            }
        }

        private void SendConnectionRequest()
        {
            // Create connection packet
            var packet = new Dictionary<string, object>
            {
                { "type", "connect" },
                { "playerId", localPlayer.PlayerId },
                { "playerName", localPlayer.PlayerName }
            };

            SendPacket(packet);
        }

        /// <summary>
        /// Disconnect from server
        /// </summary>
        public void Disconnect()
        {
            if (!isConnected)
            {
                return;
            }

            try
            {
                if (debugMode)
                {
                    Debug.Log("[Network] Disconnecting from server...");
                }

                // Send disconnection packet
                var packet = new Dictionary<string, object>
                {
                    { "type", "disconnect" },
                    { "playerId", localPlayer.PlayerId }
                };
                SendPacket(packet);

                CleanupNetworking();

                isConnected = false;
                connectedPlayers.Clear();

                if (debugMode)
                {
                    Debug.Log("[Network] Disconnected successfully");
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"[Network] Disconnection error: {e.Message}");
            }
        }

        private void CleanupNetworking()
        {
            isReceiving = false;

            if (receiveThread != null && receiveThread.IsAlive)
            {
                receiveThread.Join(1000); // Wait up to 1 second
            }

            if (udpClient != null)
            {
                udpClient.Close();
                udpClient = null;
            }
        }

        /// <summary>
        /// Send player input to server
        /// </summary>
        public void SendPlayerInput(PlayerInput input)
        {
            if (!isConnected)
            {
                return;
            }

            try
            {
                var packet = new Dictionary<string, object>
                {
                    { "type", "input" },
                    { "playerId", input.PlayerId },
                    { "inputType", input.InputType.ToString() },
                    { "position", SerializeVector3(input.Position) },
                    { "velocity", SerializeVector3(input.Velocity) },
                    { "timestamp", input.Timestamp }
                };

                SendPacket(packet);

                if (debugMode)
                {
                    Debug.Log($"[Network] Sent input: {input.InputType}");
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"[Network] Failed to send input: {e.Message}");
            }
        }

        /// <summary>
        /// Receive and process network updates
        /// </summary>
        private void ProcessNetworkUpdates()
        {
            if (!isConnected)
            {
                return;
            }

            // Process packets on main thread
            lock (packetLock)
            {
                while (receivedPackets.Count > 0)
                {
                    byte[] packet = receivedPackets.Dequeue();
                    ProcessReceivedPacket(packet);
                }
            }
        }

        private void ProcessReceivedPacket(byte[] data)
        {
            try
            {
                // Parse packet (simplified - actual implementation would use proper serialization)
                string message = Encoding.UTF8.GetString(data);
                
                if (debugMode)
                {
                    Debug.Log($"[Network] Received: {message.Substring(0, Mathf.Min(50, message.Length))}...");
                }

                // Process different packet types
                // This would be expanded with actual packet parsing
            }
            catch (Exception e)
            {
                Debug.LogError($"[Network] Packet processing error: {e.Message}");
            }
        }

        /// <summary>
        /// Synchronize game state across network
        /// </summary>
        public void SyncGameState(GameStateData state)
        {
            if (!isConnected)
            {
                return;
            }

            try
            {
                var packet = new Dictionary<string, object>
                {
                    { "type", "gameState" },
                    { "gameMode", state.GameMode },
                    { "currentRound", state.CurrentRound },
                    { "gameTime", state.GameTime }
                };

                SendPacket(packet);

                if (debugMode)
                {
                    Debug.Log("[Network] Game state synchronized");
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"[Network] State sync error: {e.Message}");
            }
        }

        private void SendPacket(Dictionary<string, object> data)
        {
            if (udpClient == null || !isConnected)
            {
                return;
            }

            try
            {
                // Simple JSON-like serialization (would use proper serialization in production)
                string json = SimpleJsonSerialize(data);
                byte[] bytes = Encoding.UTF8.GetBytes(json);
                
                udpClient.Send(bytes, bytes.Length);
            }
            catch (Exception e)
            {
                Debug.LogError($"[Network] Send packet error: {e.Message}");
            }
        }

        private string SimpleJsonSerialize(Dictionary<string, object> data)
        {
            // Very basic serialization - would use JsonUtility or similar in production
            var parts = new List<string>();
            foreach (var kvp in data)
            {
                parts.Add($"\"{kvp.Key}\":\"{kvp.Value}\"");
            }
            return "{" + string.Join(",", parts) + "}";
        }

        private string SerializeVector3(Vector3 v)
        {
            return $"{v.x},{v.y},{v.z}";
        }

        private void Update()
        {
            if (isConnected)
            {
                ProcessNetworkUpdates();
            }
        }

        private void OnDestroy()
        {
            if (isConnected)
            {
                Disconnect();
            }
        }

        private void OnApplicationQuit()
        {
            if (isConnected)
            {
                Disconnect();
            }
        }

        private string GeneratePlayerId()
        {
            return Guid.NewGuid().ToString("N").Substring(0, 8);
        }

        public bool IsConnected => isConnected;
        public NetworkPlayer LocalPlayer => localPlayer;
        public IReadOnlyList<NetworkPlayer> ConnectedPlayers => connectedPlayers.AsReadOnly();
    }

    /// <summary>
    /// Represents a network player
    /// </summary>
    [Serializable]
    public class NetworkPlayer
    {
        public string PlayerId { get; set; }
        public string PlayerName { get; set; }
        public bool IsLocal { get; set; }
        public int Ping { get; set; }
        public PlayerState State { get; set; }

        public NetworkPlayer()
        {
            State = PlayerState.Idle;
        }
    }

    /// <summary>
    /// Player state enumeration
    /// </summary>
    public enum PlayerState
    {
        Idle,
        Ready,
        Playing,
        Spectating,
        Disconnected
    }

    /// <summary>
    /// Player input data for network transmission
    /// </summary>
    [Serializable]
    public class PlayerInput
    {
        public string PlayerId { get; set; }
        public InputType InputType { get; set; }
        public Vector3 Position { get; set; }
        public Vector3 Velocity { get; set; }
        public float Timestamp { get; set; }
        public Dictionary<string, object> AdditionalData { get; set; }

        public PlayerInput()
        {
            AdditionalData = new Dictionary<string, object>();
            Timestamp = Time.time;
        }
    }

    /// <summary>
    /// Input type enumeration
    /// </summary>
    public enum InputType
    {
        Motion,
        Button,
        AnalogStick,
        DPad,
        Trigger
    }

    /// <summary>
    /// Game state data for synchronization
    /// </summary>
    [Serializable]
    public class GameStateData
    {
        public string GameMode { get; set; }
        public int CurrentRound { get; set; }
        public Dictionary<string, int> PlayerScores { get; set; }
        public float GameTime { get; set; }
        public Dictionary<string, object> CustomData { get; set; }

        public GameStateData()
        {
            PlayerScores = new Dictionary<string, int>();
            CustomData = new Dictionary<string, object>();
        }
    }

    /// <summary>
    /// Matchmaking system for online play
    /// </summary>
    public static class Matchmaking
    {
        private static List<GameSession> activeSessions = new List<GameSession>();
        private static object sessionLock = new object();

        /// <summary>
        /// Find available game sessions
        /// </summary>
        public static List<GameSession> FindSessions(string gameMode)
        {
            lock (sessionLock)
            {
                // Filter sessions by game mode and availability
                return activeSessions.FindAll(s => 
                    s.GameMode == gameMode && 
                    s.IsPublic && 
                    s.CurrentPlayers < s.MaxPlayers
                );
            }
        }

        /// <summary>
        /// Create a new game session
        /// </summary>
        public static GameSession CreateSession(string gameMode, int maxPlayers)
        {
            var session = new GameSession
            {
                SessionId = Guid.NewGuid().ToString("N"),
                GameMode = gameMode,
                MaxPlayers = maxPlayers,
                CurrentPlayers = 1,
                CreatedTime = DateTime.UtcNow
            };

            lock (sessionLock)
            {
                activeSessions.Add(session);
            }

            return session;
        }

        /// <summary>
        /// Join an existing session
        /// </summary>
        public static bool JoinSession(string sessionId)
        {
            lock (sessionLock)
            {
                var session = activeSessions.Find(s => s.SessionId == sessionId);
                if (session != null && session.CurrentPlayers < session.MaxPlayers)
                {
                    session.CurrentPlayers++;
                    return true;
                }
                return false;
            }
        }

        /// <summary>
        /// Leave a session
        /// </summary>
        public static bool LeaveSession(string sessionId)
        {
            lock (sessionLock)
            {
                var session = activeSessions.Find(s => s.SessionId == sessionId);
                if (session != null)
                {
                    session.CurrentPlayers--;
                    if (session.CurrentPlayers <= 0)
                    {
                        activeSessions.Remove(session);
                    }
                    return true;
                }
                return false;
            }
        }

        /// <summary>
        /// Clear all sessions (for cleanup/testing)
        /// </summary>
        public static void ClearSessions()
        {
            lock (sessionLock)
            {
                activeSessions.Clear();
            }
        }
    }

    /// <summary>
    /// Represents a game session
    /// </summary>
    [Serializable]
    public class GameSession
    {
        public string SessionId { get; set; }
        public string GameMode { get; set; }
        public int MaxPlayers { get; set; }
        public int CurrentPlayers { get; set; }
        public DateTime CreatedTime { get; set; }
        public string HostPlayerId { get; set; }
        public bool IsPublic { get; set; }
        public Dictionary<string, object> SessionData { get; set; }

        public GameSession()
        {
            SessionData = new Dictionary<string, object>();
            IsPublic = true;
        }
    }
}
