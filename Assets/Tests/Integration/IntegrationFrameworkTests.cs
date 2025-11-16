using NUnit.Framework;
using UnityEngine;
using RiiSports.Integration;
using RiiSports.OGWS;

namespace RiiSports.Tests.Integration
{
    /// <summary>
    /// Tests for the integration framework
    /// </summary>
    [TestFixture]
    public class IntegrationFrameworkTests
    {
        private GameObject integrationManagerObject;
        private IntegrationManager integrationManager;

        [SetUp]
        public void Setup()
        {
            // Create integration manager for testing
            integrationManagerObject = new GameObject("Test Integration Manager");
            integrationManager = integrationManagerObject.AddComponent<IntegrationManager>();
        }

        [TearDown]
        public void Teardown()
        {
            if (integrationManagerObject != null)
            {
                Object.DestroyImmediate(integrationManagerObject);
            }
        }

        [Test]
        public void TestIntegrationManager_Singleton()
        {
            Assert.IsNotNull(IntegrationManager.Instance);
            Assert.AreEqual(integrationManager, IntegrationManager.Instance);
        }

        [Test]
        public void TestIntegrationManager_GetOGWS()
        {
            integrationManager.Start();
            var ogws = integrationManager.GetOGWS();
            Assert.IsNotNull(ogws);
        }

        [Test]
        public void TestIntegrationManager_GetDolphin()
        {
            integrationManager.Start();
            var dolphin = integrationManager.GetDolphin();
            Assert.IsNotNull(dolphin);
        }

        [Test]
        public void TestIntegrationManager_ProcessMotionInput()
        {
            Vector3 acceleration = new Vector3(1.0f, 2.0f, 3.0f);
            Vector3 gyroscope = new Vector3(0.5f, 0.5f, 0.5f);

            Vector3 result = integrationManager.ProcessMotionInput(acceleration, gyroscope);
            
            // Should return a valid vector (may be processed or raw depending on availability)
            Assert.IsNotNull(result);
        }

        [Test]
        public void TestDisplayListProcessor_ParseCommand()
        {
            byte[] testData = new byte[] { 0x98, 0x01, 0x02, 0x03 };
            var command = DisplayListProcessor.ParseCommand(testData, 0);

            Assert.IsNotNull(command);
            Assert.AreEqual(0x98, command.Opcode);
            Assert.AreEqual("GX_TRIANGLES", command.Name);
        }

        [Test]
        public void TestDisplayListProcessor_ParseCommand_NOP()
        {
            byte[] testData = new byte[] { 0x00 };
            var command = DisplayListProcessor.ParseCommand(testData, 0);

            Assert.IsNotNull(command);
            Assert.AreEqual(0x00, command.Opcode);
            Assert.AreEqual("GX_NOP", command.Name);
        }

        [Test]
        public void TestDisplayListProcessor_InvalidData()
        {
            byte[] testData = null;
            var command = DisplayListProcessor.ParseCommand(testData, 0);

            Assert.IsNull(command);
        }

        [Test]
        public void TestMemoryManager_IsValidAddress()
        {
            // Valid MEM1 address
            Assert.IsTrue(MemoryManager.IsValidAddress(0x80000000));
            
            // Valid MEM2 address
            Assert.IsTrue(MemoryManager.IsValidAddress(0x90000000));
            
            // Invalid address
            Assert.IsFalse(MemoryManager.IsValidAddress(0x00000000));
            Assert.IsFalse(MemoryManager.IsValidAddress(0xFFFFFFFF));
        }

        [Test]
        public void TestMemoryManager_ReadMemory()
        {
            MemoryManager.Initialize();
            byte[] data = MemoryManager.ReadMemory(0x80000000, 256);
            
            Assert.IsNotNull(data);
            Assert.AreEqual(256, data.Length);
        }

        [Test]
        public void TestMemoryManager_ReadWriteU32()
        {
            MemoryManager.Initialize();
            uint testValue = 0x12345678;
            uint address = 0x80000100;

            MemoryManager.WriteU32(address, testValue);
            uint readValue = MemoryManager.ReadU32(address);

            Assert.AreEqual(testValue, readValue);
        }

        [Test]
        public void TestMemoryManager_WriteAndRead()
        {
            MemoryManager.Initialize();
            byte[] testData = new byte[] { 0x01, 0x02, 0x03, 0x04 };
            uint address = 0x80000200;

            MemoryManager.WriteMemory(address, testData);
            byte[] readData = MemoryManager.ReadMemory(address, testData.Length);

            Assert.AreEqual(testData.Length, readData.Length);
            for (int i = 0; i < testData.Length; i++)
            {
                Assert.AreEqual(testData[i], readData[i]);
            }
        }

        [Test]
        public void TestDisplayListProcessor_GetCommandSize()
        {
            DisplayListProcessor.Initialize();
            
            Assert.AreEqual(1, DisplayListProcessor.GetCommandSize(0x00)); // NOP
            Assert.AreEqual(5, DisplayListProcessor.GetCommandSize(0x61)); // LOAD_BP_REG
            Assert.AreEqual(1, DisplayListProcessor.GetCommandSize(0x98)); // TRIANGLES
        }

        [Test]
        public void TestOGWSUtility_ValidateDisplayListData()
        {
            // Valid data
            byte[] validData = new byte[1024];
            Assert.IsTrue(OGWSUtility.ValidateDisplayListData(validData));

            // Null data
            Assert.IsFalse(OGWSUtility.ValidateDisplayListData(null));

            // Empty data
            Assert.IsFalse(OGWSUtility.ValidateDisplayListData(new byte[0]));

            // Too large data
            byte[] tooLarge = new byte[11 * 1024 * 1024]; // 11MB
            Assert.IsFalse(OGWSUtility.ValidateDisplayListData(tooLarge));
        }

        [Test]
        public void TestOGWSUtility_ConvertMeshToDisplayList()
        {
            // Create a simple test mesh
            Mesh testMesh = new Mesh();
            testMesh.vertices = new Vector3[]
            {
                new Vector3(0, 0, 0),
                new Vector3(1, 0, 0),
                new Vector3(0, 1, 0)
            };
            testMesh.triangles = new int[] { 0, 1, 2 };

            byte[] displayList = OGWSUtility.ConvertMeshToDisplayList(testMesh);

            Assert.IsNotNull(displayList);
            Assert.Greater(displayList.Length, 0);
            
            // Check for GX_TRIANGLES command
            Assert.AreEqual(0x98, displayList[0]);
        }

        [Test]
        public void TestOGWSUtility_ConvertMeshToDisplayList_NullMesh()
        {
            byte[] displayList = OGWSUtility.ConvertMeshToDisplayList(null);

            Assert.IsNotNull(displayList);
            Assert.AreEqual(0, displayList.Length);
        }
    }
}
