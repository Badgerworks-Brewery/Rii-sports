using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using UnityEngine;

namespace RiiSports.Input
{
    /// <summary>
    /// DSU (Cemuhook Motion Provider) UDP client for receiving motion data
    /// </summary>
    public class DSUClient : MonoBehaviour
    {
        [Header("DSU Configuration")]
        [SerializeField] private int serverPort = 26760;
        [SerializeField] private string serverIP = "127.0.0.1";
        [SerializeField] private bool autoConnect = true;
        [SerializeField] private float connectionTimeout = 5f;
        [SerializeField] private bool debugLogging = false;
        
        [Header("Motion Data")]
        [SerializeField] private DSUMotionData currentMotionData;
        [SerializeField] private bool isConnected = false;
        
        // Events
        public event Action<DSUMotionData> OnMotionDataReceived;
        public event Action OnConnected;
        public event Action OnDisconnected;
        
        // Network components
        private UdpClient udpClient;
        private IPEndPoint serverEndPoint;
        private Thread receiveThread;
        private bool isReceiving = false;
        
        // DSU Protocol constants
        private const string DSU_MAGIC = "DSUC";
        private const ushort DSU_VERSION = 1001;
        private const uint DSU_CLIENT_ID = 0x12345678;
        
        // Packet types
        private const uint DSUC_VERSIONREQ = 0x100000;
        private const uint DSUS_VERSION = 0x100000;
        private const uint DSUC_LISTPORTS = 0x100001;
        private const uint DSUS_PORTINFO = 0x100001;
        private const uint DSUC_PADDATAREQ = 0x100002;
        private const uint DSUS_PADDATARSP = 0x100002;
        
        private void Start()
        {
            if (autoConnect)
            {
                Connect();
            }
        }
        
        private void OnDestroy()
        {
            Disconnect();
        }
        
        public void Connect()
        {
            try
            {
                serverEndPoint = new IPEndPoint(IPAddress.Parse(serverIP), serverPort);
                udpClient = new UdpClient();
                udpClient.Connect(serverEndPoint);
                
                isReceiving = true;
                receiveThread = new Thread(ReceiveData);
                receiveThread.Start();
                
                // Send version request to establish connection
                SendVersionRequest();
                
                if (debugLogging)
                    Debug.Log($"DSU Client connecting to {serverIP}:{serverPort}");
                
            }
            catch (Exception e)
            {
                Debug.LogError($"DSU Client connection failed: {e.Message}");
                isConnected = false;
            }
        }
        
        public void Disconnect()
        {
            isReceiving = false;
            isConnected = false;
            
            if (receiveThread != null && receiveThread.IsAlive)
            {
                receiveThread.Join(1000);
                if (receiveThread.IsAlive)
                    receiveThread.Abort();
            }
            
            if (udpClient != null)
            {
                udpClient.Close();
                udpClient = null;
            }
            
            OnDisconnected?.Invoke();
            
            if (debugLogging)
                Debug.Log("DSU Client disconnected");
        }
        
        private void SendVersionRequest()
        {
            try
            {
                byte[] packet = CreateDSUPacket(DSUC_VERSIONREQ, new byte[0]);
                udpClient.Send(packet, packet.Length);
                
                if (debugLogging)
                    Debug.Log("DSU Version request sent");
            }
            catch (Exception e)
            {
                Debug.LogError($"Failed to send version request: {e.Message}");
            }
        }
        
        private void SendPadDataRequest(byte padId = 0)
        {
            try
            {
                byte[] data = new byte[4];
                data[0] = 0x01; // Request type
                data[1] = padId; // Pad ID
                data[2] = 0x00; // Reserved
                data[3] = 0x00; // Reserved
                
                byte[] packet = CreateDSUPacket(DSUC_PADDATAREQ, data);
                udpClient.Send(packet, packet.Length);
                
                if (debugLogging)
                    Debug.Log($"DSU Pad data request sent for pad {padId}");
            }
            catch (Exception e)
            {
                Debug.LogError($"Failed to send pad data request: {e.Message}");
            }
        }
        
        private byte[] CreateDSUPacket(uint messageType, byte[] data)
        {
            byte[] packet = new byte[16 + data.Length];
            int offset = 0;
            
            // Magic "DSUC"
            System.Text.Encoding.ASCII.GetBytes(DSU_MAGIC).CopyTo(packet, offset);
            offset += 4;
            
            // Version
            BitConverter.GetBytes(DSU_VERSION).CopyTo(packet, offset);
            offset += 2;
            
            // Data length
            BitConverter.GetBytes((ushort)data.Length).CopyTo(packet, offset);
            offset += 2;
            
            // CRC32 (placeholder, will be calculated)
            offset += 4;
            
            // Client ID
            BitConverter.GetBytes(DSU_CLIENT_ID).CopyTo(packet, offset);
            offset += 4;
            
            // Message type
            BitConverter.GetBytes(messageType).CopyTo(packet, offset);
            offset += 4;
            
            // Data
            data.CopyTo(packet, offset);
            
            // Calculate and set CRC32
            uint crc = CalculateCRC32(packet, 8, packet.Length - 8);
            BitConverter.GetBytes(crc).CopyTo(packet, 8);
            
            return packet;
        }
        
        private void ReceiveData()
        {
            while (isReceiving)
            {
                try
                {
                    IPEndPoint remoteEndPoint = new IPEndPoint(IPAddress.Any, 0);
                    byte[] receivedData = udpClient.Receive(ref remoteEndPoint);
                    
                    if (receivedData.Length >= 16)
                    {
                        ProcessDSUPacket(receivedData);
                    }
                }
                catch (SocketException)
                {
                    // Socket closed, exit gracefully
                    break;
                }
                catch (Exception e)
                {
                    if (isReceiving)
                        Debug.LogError($"DSU receive error: {e.Message}");
                    break;
                }
            }
        }
        
        private void ProcessDSUPacket(byte[] packet)
        {
            try
            {
                // Verify magic
                string magic = System.Text.Encoding.ASCII.GetString(packet, 0, 4);
                if (magic != "DSUS") return;
                
                // Get message type
                uint messageType = BitConverter.ToUInt32(packet, 12);
                
                switch (messageType)
                {
                    case DSUS_VERSION:
                        HandleVersionResponse(packet);
                        break;
                    case DSUS_PORTINFO:
                        HandlePortInfo(packet);
                        break;
                    case DSUS_PADDATARSP:
                        HandlePadDataResponse(packet);
                        break;
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"Error processing DSU packet: {e.Message}");
            }
        }
        
        private void HandleVersionResponse(byte[] packet)
        {
            if (!isConnected)
            {
                isConnected = true;
                OnConnected?.Invoke();
                
                // Request pad data
                SendPadDataRequest();
                
                if (debugLogging)
                    Debug.Log("DSU Client connected successfully");
            }
        }
        
        private void HandlePortInfo(byte[] packet)
        {
            // Port info received, request pad data
            SendPadDataRequest();
        }
        
        private void HandlePadDataResponse(byte[] packet)
        {
            if (packet.Length < 80) return; // Minimum packet size for motion data
            
            try
            {
                int offset = 16; // Skip header
                
                // Skip pad info (12 bytes)
                offset += 12;
                
                // Read motion data (starts at offset 28)
                offset = 28;
                
                // Accelerometer (12 bytes - 3 floats)
                float accelX = BitConverter.ToSingle(packet, offset);
                float accelY = BitConverter.ToSingle(packet, offset + 4);
                float accelZ = BitConverter.ToSingle(packet, offset + 8);
                offset += 12;
                
                // Gyroscope (12 bytes - 3 floats)
                float gyroX = BitConverter.ToSingle(packet, offset);
                float gyroY = BitConverter.ToSingle(packet, offset + 4);
                float gyroZ = BitConverter.ToSingle(packet, offset + 8);
                offset += 12;
                
                // Create motion data
                Vector3 accelerometer = new Vector3(accelX, accelY, accelZ);
                Vector3 gyroscope = new Vector3(gyroX, gyroY, gyroZ);
                Vector3 orientation = CalculateOrientation(accelerometer);
                
                DSUMotionData motionData = new DSUMotionData(
                    accelerometer,
                    gyroscope,
                    orientation,
                    true,
                    Time.time
                );
                
                // Update on main thread
                UnityMainThreadDispatcher.Instance().Enqueue(() => {
                    currentMotionData = motionData;
                    OnMotionDataReceived?.Invoke(motionData);
                });
                
                // Continue requesting data
                SendPadDataRequest();
            }
            catch (Exception e)
            {
                Debug.LogError($"Error parsing motion data: {e.Message}");
            }
        }
        
        private Vector3 CalculateOrientation(Vector3 accelerometer)
        {
            // Calculate orientation from accelerometer data
            float pitch = Mathf.Atan2(-accelerometer.x, Mathf.Sqrt(accelerometer.y * accelerometer.y + accelerometer.z * accelerometer.z));
            float roll = Mathf.Atan2(accelerometer.y, accelerometer.z);
            float yaw = 0f; // Cannot determine yaw from accelerometer alone
            
            return new Vector3(pitch * Mathf.Rad2Deg, yaw, roll * Mathf.Rad2Deg);
        }
        
        private uint CalculateCRC32(byte[] data, int offset, int length)
        {
            // Simple CRC32 implementation
            uint crc = 0xFFFFFFFF;
            for (int i = offset; i < offset + length; i++)
            {
                crc ^= data[i];
                for (int j = 0; j < 8; j++)
                {
                    if ((crc & 1) != 0)
                        crc = (crc >> 1) ^ 0xEDB88320;
                    else
                        crc >>= 1;
                }
            }
            return ~crc;
        }
        
        // Public getters
        public DSUMotionData GetCurrentMotionData() => currentMotionData;
        public bool IsConnected => isConnected;
        
        // Unity Inspector methods
        [ContextMenu("Connect")]
        public void ConnectFromInspector() => Connect();
        
        [ContextMenu("Disconnect")]
        public void DisconnectFromInspector() => Disconnect();
    }
}