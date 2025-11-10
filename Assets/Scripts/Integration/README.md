# Integration Framework

This directory contains the core integration framework for migrating code from external sources into the Rii Sports Unity project.

## Overview

The integration framework provides C# wrappers and abstraction layers for:
- **OGWS (doldecomp/ogws)**: Wii Sports decompilation
- **Dolphin Emulator**: GameCube/Wii graphics and memory emulation
- **Online Multiplayer**: Network play based on wii-otn architecture

## Components

### IntegrationManager.cs
Central coordinator that manages all integration systems. This is your main entry point.

**Usage:**
```csharp
var manager = IntegrationManager.Instance;
if (manager.AreSystemsReady())
{
    // Systems are ready to use
}
```

### DolphinIntegration.cs
GameCube/Wii emulation layer providing:
- GX (GameCube/Wii graphics) command parsing
- Memory management (MEM1/MEM2 abstraction)
- Wiimote input translation
- Display list processing

**Key Classes:**
- `DolphinIntegration` - Main integration component
- `DisplayListProcessor` - GX command parser
- `MemoryManager` - GC/Wii memory abstraction
- `GXCommand` - GX command structure

### WiiSportsIntegration.cs
Sport-specific integration modules from OGWS decompilation:
- `WiiSportsBase` - Base class for all sports
- `TennisIntegration` - Tennis game logic
- `GolfIntegration` - Golf game logic
- `BoxingIntegration` - Boxing game logic
- `BaseballIntegration` - Baseball game logic
- `WiiFitIntegration` - Wii Fit base class

**Usage:**
```csharp
var tennis = gameObject.AddComponent<TennisIntegration>();
tennis.UpdateRacket(position, velocity);
```

### OnlineMultiplayer.cs
Network play system based on wii-otn architecture:
- Client-server architecture
- Session management
- Matchmaking
- Player synchronization

**Key Classes:**
- `OnlineMultiplayer` - Main multiplayer component
- `NetworkPlayer` - Player representation
- `PlayerInput` - Input data for network transmission
- `GameStateData` - Game state synchronization
- `Matchmaking` - Session finding and creation

## Integration with Existing Systems

### Motion Controls
The framework integrates with the existing DSU motion control system:

```csharp
var dolphin = IntegrationManager.Instance.GetDolphin();
Vector3 calibrated = dolphin.TranslateWiimoteMotion(accel, gyro);
```

### Bowling Game
Enhanced the existing bowling implementation:

```csharp
var ogws = IntegrationManager.Instance.GetOGWS();
// Use OGWS physics for bowling calculations
```

## File Structure

```
Assets/Scripts/Integration/
├── README.md                      # This file
├── IntegrationManager.cs          # Central coordinator
├── DolphinIntegration.cs          # Dolphin emulation layer
├── WiiSportsIntegration.cs        # Sport-specific modules
└── OnlineMultiplayer.cs           # Network play system
```

## Testing

Tests are located in `Assets/Tests/Integration/`:
- `IntegrationFrameworkTests.cs` - Unit tests for all components

Run tests through Unity Test Runner (Window > General > Test Runner).

## Documentation

See [INTEGRATION_GUIDE.md](../../../INTEGRATION_GUIDE.md) in the project root for:
- Detailed usage examples
- API reference
- Migration guide
- Build instructions

## Future Work

### Phase 2: OGWS Native Integration
- Port actual C++ code from OGWS
- Implement native function bindings
- Add complete physics implementations

### Phase 3: Complete Dolphin Integration
- Full GX command parsing
- Shader translation (TEV to Unity)
- Texture format conversion

### Phase 4: Switch Sports
- Ryujinx integration layer
- Modern graphics enhancements

## Contributing

When adding new integration features:
1. Follow existing architecture patterns
2. Add comprehensive XML documentation
3. Create tests for new functionality
4. Update documentation
5. Ensure backward compatibility

## References

- **OGWS**: https://github.com/doldecomp/ogws
- **Dolphin**: https://github.com/dolphin-emu/dolphin
- **Wii-OTN**: https://github.com/Identityofsine/wii-otn
- **Integration Guide**: [INTEGRATION_GUIDE.md](../../../INTEGRATION_GUIDE.md)
