# Integration Framework Documentation

## Overview

This integration framework provides a comprehensive system for migrating code from:
- **OGWS (doldecomp/ogws)**: Wii Sports decompilation
- **Dolphin Emulator**: Graphics and emulation layers
- **Switch Sports (Ryujinx)**: Modern console reference
- **Wii-OTN**: Online multiplayer architecture

## Architecture

### Core Components

1. **IntegrationManager** (`Assets/Scripts/Integration/IntegrationManager.cs`)
   - Central coordinator for all integration systems
   - Manages OGWS, Dolphin, and online multiplayer components
   - Provides unified API for accessing integration features

2. **OGWSIntegration** (`Assets/Scripts/OGWS/OGWSIntegration.cs`)
   - Interface to Wii Sports decompiled code
   - Display list processing from original game
   - Native function wrappers (C++ to C# interop)

3. **DolphinIntegration** (`Assets/Scripts/Integration/DolphinIntegration.cs`)
   - GameCube/Wii graphics emulation
   - Memory management abstraction
   - Wiimote input translation
   - Display list processor for GX commands

4. **WiiSportsIntegration** (`Assets/Scripts/Integration/WiiSportsIntegration.cs`)
   - Base classes for all Wii Sports games
   - Sport-specific implementations:
     - Tennis
     - Golf
     - Boxing
     - Baseball
   - Wii Fit support

5. **OnlineMultiplayer** (`Assets/Scripts/Integration/OnlineMultiplayer.cs`)
   - Network play based on wii-otn architecture
   - Matchmaking system
   - Player synchronization
   - Session management

## Usage

### Basic Setup

1. **Add IntegrationManager to scene:**
```csharp
// In your main scene, add IntegrationManager component
var manager = new GameObject("Integration Manager");
manager.AddComponent<IntegrationManager>();
```

2. **Configure integration systems:**
```csharp
var manager = IntegrationManager.Instance;
// Systems are automatically initialized based on configuration
```

3. **Access integration features:**
```csharp
// Get OGWS integration
var ogws = IntegrationManager.Instance.GetOGWS();

// Get Dolphin integration
var dolphin = IntegrationManager.Instance.GetDolphin();

// Get online multiplayer
var online = IntegrationManager.Instance.GetOnline();
```

### Sport-Specific Integration

#### Tennis Example

```csharp
using RiiSports.Integration.Sports;

public class TennisGame : MonoBehaviour
{
    private TennisIntegration tennis;

    void Start()
    {
        tennis = gameObject.AddComponent<TennisIntegration>();
    }

    void Update()
    {
        // Update racket from motion controls
        Vector3 racketPos = GetRacketPosition();
        Vector3 racketVel = GetRacketVelocity();
        tennis.UpdateRacket(racketPos, racketVel);
    }
}
```

#### Golf Example

```csharp
using RiiSports.Integration.Sports;

public class GolfGame : MonoBehaviour
{
    private GolfIntegration golf;

    void Start()
    {
        golf = gameObject.AddComponent<GolfIntegration>();
    }

    public void OnSwingComplete()
    {
        golf.ExecuteSwing();
    }
}
```

### Graphics Processing

```csharp
// Process GC/Wii display list data
byte[] displayListData = GetDisplayListFromOGWS();
bool success = IntegrationManager.Instance.ProcessGraphicsData(displayListData);

if (success)
{
    Debug.Log("Display list processed successfully");
}
```

### Motion Input Translation

```csharp
// Translate Wiimote motion to Unity coordinates
Vector3 acceleration = GetWiimoteAcceleration();
Vector3 gyroscope = GetWiimoteGyroscope();

Vector3 unityMotion = IntegrationManager.Instance.ProcessMotionInput(acceleration, gyroscope);
```

### Online Multiplayer

```csharp
// Connect to server
var online = IntegrationManager.Instance.GetOnline();
online.Connect();

// Send player input
var input = new PlayerInput
{
    InputType = InputType.Motion,
    Position = transform.position,
    Velocity = rigidbody.velocity
};
online.SendPlayerInput(input);

// Sync game state
var gameState = new GameStateData
{
    GameMode = "Tennis",
    CurrentRound = 1
};
IntegrationManager.Instance.SyncOnlineState(gameState);
```

## OGWS Integration Details

### Native Function Mapping

The OGWS integration provides C# wrappers for native C++ functions:

```csharp
// Display list analysis
int result = ogws.ProcessDisplayList(displayListData);

// Reset analysis system
ogws.ResetAnalysis();

// Check availability
bool available = ogws.IsOGWSAvailable();
```

### Supported OGWS Features

- Display list processing (EGG_AnalyzeDL)
- Graphics command interpretation
- Data structure conversion (C++ to C#)

## Dolphin Integration Details

### Graphics System

The Dolphin integration includes a GX (GameCube/Wii graphics) command parser:

```csharp
using RiiSports.Integration;

// Parse GX commands
var command = DisplayListProcessor.ParseCommand(displayListData, offset);
Debug.Log($"Command: {command.Name} (0x{command.Opcode:X2})");

// Convert to Unity mesh
Mesh unityMesh = DisplayListProcessor.ConvertToUnityMesh(displayListData);
```

### Memory Management

```csharp
using RiiSports.Integration;

// Read from emulated memory
byte[] data = MemoryManager.ReadMemory(0x80000000, 256);

// Write to emulated memory
MemoryManager.WriteMemory(0x80000000, data);

// Validate address
bool valid = MemoryManager.IsValidAddress(0x80000000);
```

### Supported GX Commands

- `GX_NOP` (0x00) - No operation
- `GX_LOAD_BP_REG` (0x61) - Load BP register
- `GX_TRIANGLES` (0x98) - Triangle primitive
- `GX_TRIANGLE_STRIP` (0x99) - Triangle strip
- `GX_TRIANGLE_FAN` (0x9A) - Triangle fan
- `GX_QUADS` (0xA0) - Quad primitive

## Online Multiplayer Details

### Network Architecture

Based on wii-otn (Wii Online Tennis Network):

- Client-server architecture
- UDP-based communication for low latency
- State synchronization
- Matchmaking system

### Session Management

```csharp
// Find available sessions
var sessions = Matchmaking.FindSessions("Tennis");

// Create new session
var session = Matchmaking.CreateSession("Tennis", maxPlayers: 4);

// Join session
bool joined = Matchmaking.JoinSession(session.SessionId);
```

## Integration with Existing Systems

### Motion Controls

The integration framework works seamlessly with the existing DSU motion control system:

```csharp
// In PlayerInputManager or custom input handler
var dolphin = IntegrationManager.Instance.GetDolphin();
if (dolphin != null && dolphin.IsAvailable())
{
    Vector3 calibratedMotion = dolphin.TranslateWiimoteMotion(
        dsuMotionData.Acceleration,
        dsuMotionData.Gyroscope
    );
}
```

### Existing Bowling Game

The current bowling implementation can be enhanced with OGWS physics:

```csharp
// In BowlingBall.cs
private void ThrowBallWithOGWS()
{
    var ogws = IntegrationManager.Instance.GetOGWS();
    if (ogws != null && ogws.IsOGWSAvailable())
    {
        // Use OGWS physics calculations
        // This would be implemented when native code is available
    }
}
```

## Build System

### Compiling OGWS Native Code

The OGWS native code needs to be compiled for Unity integration:

```bash
# From repository root
cd ogws
make all
make install
```

This builds the native libraries and copies them to `Assets/Plugins/OGWS/`.

### Platform-Specific Builds

Native libraries need to be built for each target platform:
- Windows: `.dll`
- macOS: `.dylib`
- Linux: `.so`

## Testing

### Integration Tests

Create tests to verify integration functionality:

```csharp
using UnityEngine.TestTools;
using NUnit.Framework;

[TestFixture]
public class IntegrationTests
{
    [Test]
    public void TestIntegrationManager_Initialization()
    {
        var manager = IntegrationManager.Instance;
        Assert.IsTrue(manager.AreSystemsReady());
    }

    [Test]
    public void TestOGWS_DisplayListProcessing()
    {
        var ogws = IntegrationManager.Instance.GetOGWS();
        byte[] testData = new byte[] { 0x98, 0x01, 0x00, 0x00 };
        int result = ogws.ProcessDisplayList(testData);
        Assert.AreEqual(0, result);
    }
}
```

## Future Enhancements

### Planned Features

1. **Complete OGWS Native Implementation**
   - Full C++ to C# binding
   - All sports game logic ported
   - Original physics implementations

2. **Dolphin Graphics Pipeline**
   - Complete GX command parsing
   - Shader translation (TEV to Unity shaders)
   - Texture format conversion

3. **Switch Sports Integration**
   - Ryujinx emulation layer
   - Modern graphics enhancements
   - Cross-platform compatibility

4. **Enhanced Online Features**
   - Voice chat
   - Replay system
   - Leaderboards
   - Tournament mode

## References

- **OGWS Repository**: https://github.com/doldecomp/ogws
- **Dolphin Emulator**: https://github.com/dolphin-emu/dolphin
- **Ryujinx (Switch)**: https://git.suyu.dev/ryujinx-backup/Ryujinx.git
- **Wii-OTN**: https://github.com/Identityofsine/wii-otn

## Contributing

When adding new integration features:

1. Follow the existing architecture patterns
2. Add comprehensive XML documentation
3. Create tests for new functionality
4. Update this documentation
5. Ensure backward compatibility

## License

This integration framework follows the same license as the Rii Sports project.
