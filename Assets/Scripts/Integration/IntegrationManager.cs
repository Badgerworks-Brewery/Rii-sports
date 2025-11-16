using System;
using UnityEngine;
using RiiSports.OGWS;
using RiiSports.Integration;
using RiiSports.Integration.Network;

namespace RiiSports.Integration
{
    /// <summary>
    /// Central integration manager that coordinates OGWS, Dolphin, and online multiplayer
    /// This is the main entry point for all code migration from external sources
    /// </summary>
    public class IntegrationManager : MonoBehaviour
    {
        [Header("Integration Systems")]
        [SerializeField] private bool enableOGWSIntegration = true;
        [SerializeField] private bool enableDolphinIntegration = true;
        [SerializeField] private bool enableOnlineMultiplayer = false;
        [SerializeField] private bool debugMode = false;

        [Header("References")]
        [SerializeField] private OGWSIntegration ogwsIntegration;
        [SerializeField] private DolphinIntegration dolphinIntegration;
        [SerializeField] private OnlineMultiplayer onlineMultiplayer;

        private static IntegrationManager instance;
        public static IntegrationManager Instance => instance;

        private bool isInitialized = false;

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
            InitializeIntegrationSystems();
        }

        /// <summary>
        /// Initialize all integration systems
        /// </summary>
        private void InitializeIntegrationSystems()
        {
            try
            {
                if (debugMode)
                {
                    Debug.Log("[IntegrationManager] Initializing integration systems...");
                }

                // Initialize OGWS (Wii Sports decompilation)
                if (enableOGWSIntegration)
                {
                    InitializeOGWS();
                }

                // Initialize Dolphin emulation layer
                if (enableDolphinIntegration)
                {
                    InitializeDolphin();
                }

                // Initialize online multiplayer
                if (enableOnlineMultiplayer)
                {
                    InitializeOnline();
                }

                isInitialized = true;

                if (debugMode)
                {
                    Debug.Log("[IntegrationManager] All integration systems initialized successfully");
                    LogSystemStatus();
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"[IntegrationManager] Failed to initialize: {e.Message}");
            }
        }

        private void InitializeOGWS()
        {
            if (ogwsIntegration == null)
            {
                var ogwsObj = new GameObject("OGWS Integration");
                ogwsObj.transform.SetParent(transform);
                ogwsIntegration = ogwsObj.AddComponent<OGWSIntegration>();
            }

            if (debugMode)
            {
                Debug.Log("[IntegrationManager] OGWS integration initialized");
            }
        }

        private void InitializeDolphin()
        {
            if (dolphinIntegration == null)
            {
                var dolphinObj = new GameObject("Dolphin Integration");
                dolphinObj.transform.SetParent(transform);
                dolphinIntegration = dolphinObj.AddComponent<DolphinIntegration>();
            }

            if (debugMode)
            {
                Debug.Log("[IntegrationManager] Dolphin integration initialized");
            }
        }

        private void InitializeOnline()
        {
            if (onlineMultiplayer == null)
            {
                var onlineObj = new GameObject("Online Multiplayer");
                onlineObj.transform.SetParent(transform);
                onlineMultiplayer = onlineObj.AddComponent<OnlineMultiplayer>();
            }

            if (debugMode)
            {
                Debug.Log("[IntegrationManager] Online multiplayer initialized");
            }
        }

        /// <summary>
        /// Log status of all integration systems
        /// </summary>
        private void LogSystemStatus()
        {
            Debug.Log("=== Integration Systems Status ===");
            
            if (ogwsIntegration != null)
            {
                Debug.Log($"OGWS: {ogwsIntegration.GetStatusInfo()}");
            }
            
            if (dolphinIntegration != null)
            {
                Debug.Log($"Dolphin: {dolphinIntegration.GetStatusInfo()}");
            }
            
            if (onlineMultiplayer != null)
            {
                Debug.Log($"Online: {(onlineMultiplayer.IsConnected ? "Connected" : "Offline")}");
            }
            
            Debug.Log("==================================");
        }

        /// <summary>
        /// Get OGWS integration instance
        /// </summary>
        public OGWSIntegration GetOGWS()
        {
            return ogwsIntegration;
        }

        /// <summary>
        /// Get Dolphin integration instance
        /// </summary>
        public DolphinIntegration GetDolphin()
        {
            return dolphinIntegration;
        }

        /// <summary>
        /// Get online multiplayer instance
        /// </summary>
        public OnlineMultiplayer GetOnline()
        {
            return onlineMultiplayer;
        }

        /// <summary>
        /// Check if all systems are ready
        /// </summary>
        public bool AreSystemsReady()
        {
            if (!isInitialized)
            {
                return false;
            }

            bool ogwsReady = !enableOGWSIntegration || (ogwsIntegration != null && ogwsIntegration.IsOGWSAvailable());
            bool dolphinReady = !enableDolphinIntegration || (dolphinIntegration != null && dolphinIntegration.IsAvailable());
            bool onlineReady = !enableOnlineMultiplayer || (onlineMultiplayer != null);

            return ogwsReady && dolphinReady && onlineReady;
        }

        /// <summary>
        /// Process graphics data through integration pipeline
        /// </summary>
        public bool ProcessGraphicsData(byte[] displayListData)
        {
            if (!isInitialized)
            {
                return false;
            }

            bool processed = false;

            // Try OGWS processing first
            if (enableOGWSIntegration && ogwsIntegration != null)
            {
                processed = ogwsIntegration.ProcessDisplayList(displayListData) == 0;
            }

            // If OGWS processing fails, try Dolphin
            if (!processed && enableDolphinIntegration && dolphinIntegration != null)
            {
                processed = dolphinIntegration.ProcessDisplayList(displayListData);
            }

            return processed;
        }

        /// <summary>
        /// Process motion input through integration pipeline
        /// </summary>
        public Vector3 ProcessMotionInput(Vector3 acceleration, Vector3 gyroscope)
        {
            if (!isInitialized)
            {
                return Vector3.zero;
            }

            // Use Dolphin to translate Wiimote motion data
            if (enableDolphinIntegration && dolphinIntegration != null)
            {
                return dolphinIntegration.TranslateWiimoteMotion(acceleration, gyroscope);
            }

            return acceleration; // Fallback to raw acceleration
        }

        /// <summary>
        /// Synchronize game state for online play
        /// </summary>
        public void SyncOnlineState(GameStateData state)
        {
            if (enableOnlineMultiplayer && onlineMultiplayer != null && onlineMultiplayer.IsConnected)
            {
                onlineMultiplayer.SyncGameState(state);
            }
        }

        public bool IsInitialized => isInitialized;
    }

    /// <summary>
    /// Integration status information
    /// </summary>
    [Serializable]
    public class IntegrationStatus
    {
        public bool OGWSAvailable { get; set; }
        public bool DolphinAvailable { get; set; }
        public bool OnlineAvailable { get; set; }
        public string Version { get; set; }

        public IntegrationStatus()
        {
            Version = "1.0.0";
        }
    }
}
