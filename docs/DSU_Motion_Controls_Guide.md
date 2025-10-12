# DSU Motion Controls Guide for Rii Sports

## Overview

Rii Sports now supports DSU (Cemuhook Motion Provider protocol) for authentic Wii Sports-style motion controls. This system allows players to use smartphones, DualShock 4 controllers, or other motion-capable devices as Wiimotes for realistic bowling, tennis, and other sports gameplay.

## What is DSU?

DSU (Cemuhook Motion Provider protocol) is a UDP-based protocol that transmits motion sensor data (gyroscope, accelerometer) from various devices to applications. Originally developed for the Cemu Wii U emulator, it's now widely used for motion control in games and emulators.

## Supported Devices

- **Smartphones** (via DSU apps like cemuhook-android)
- **DualShock 4 Controllers** (via DS4Windows with motion support)
- **Nintendo Switch Pro Controllers** (via specialized software)
- **Custom motion controllers** that support DSU protocol

## Setup Instructions

### 1. Install DSU Motion Provider

#### For Android Smartphones:
1. Download and install a DSU app like "cemuhook-android" or "DSU Client"
2. Connect your phone to the same Wi-Fi network as your computer
3. Note your phone's IP address (usually shown in the app)
4. Start the DSU server on your phone (default port: 26760)

#### For DualShock 4:
1. Install DS4Windows with motion support
2. Enable "UDP Server" in DS4Windows settings
3. Set the server port to 26760
4. Connect your DS4 controller via USB or Bluetooth

### 2. Configure Rii Sports

1. Open Rii Sports in Unity Editor or as a built game
2. Find the PlayerInputManager in the scene
3. In the Inspector, configure the DSU settings:
   - **Server IP**: IP address of your motion device (e.g., "192.168.1.100" for phone)
   - **Server Port**: Usually 26760 (default DSU port)
   - **Enable Motion Controls**: Check this box
   - **Motion Sensitivity**: Adjust to your preference (1.0 is default)

### 3. Test Connection

1. Start the DSU server on your device
2. Play the game - you should see "Motion controls connected" in the console
3. Try making bowling motions - the ball should respond to your movements

## How It Works

### Motion Data Processing

The system processes three types of motion data:
- **Accelerometer**: Detects linear acceleration and orientation
- **Gyroscope**: Detects rotational movement
- **Calculated Orientation**: Derived from accelerometer data

### Gesture Detection

The motion system recognizes several gestures:
- **Swing Forward**: Primary bowling throw motion
- **Swing Left/Right**: Directional control
- **Shake**: Special interactions (future use)
- **Bowling Swing**: Specialized bowling motion detection

### Bowling Mechanics

For bowling specifically:
1. **Swing Detection**: System detects forward swinging motion
2. **Force Calculation**: Swing velocity determines ball speed
3. **Direction Control**: Side-to-side motion controls ball direction
4. **Spin Application**: Rotational motion adds spin to the ball

## Configuration Options

### Motion Sensitivity Settings

- **Motion Sensitivity** (0.1 - 5.0): Overall sensitivity multiplier
- **Swing Threshold** (0.5 - 5.0): Minimum acceleration for swing detection
- **Bowling Swing Min Velocity** (0.5 - 3.0): Minimum speed for bowling throws
- **Motion Force Multiplier** (50 - 500): Converts motion to game force

### Advanced Settings

- **Motion History Size** (5 - 20): Number of motion samples for gesture detection
- **Gesture Timeout** (0.1 - 2.0): Prevents rapid repeated gesture detection
- **Motion Smoothing** (0 - 0.9): Smooths motion data to reduce jitter

## Troubleshooting

### Connection Issues

**Problem**: "Motion controls not connecting"
- **Solution**: Check that device and computer are on same network
- **Solution**: Verify DSU server is running on device
- **Solution**: Check firewall settings (allow port 26760)

**Problem**: "Motion data not received"
- **Solution**: Restart DSU server on device
- **Solution**: Check IP address configuration
- **Solution**: Try different port number

### Motion Detection Issues

**Problem**: "Gestures not detected"
- **Solution**: Lower swing threshold in settings
- **Solution**: Increase motion sensitivity
- **Solution**: Check device orientation (hold naturally)

**Problem**: "Ball throws too weak/strong"
- **Solution**: Adjust motion force multiplier
- **Solution**: Modify motion sensitivity
- **Solution**: Check min/max throw force limits

### Performance Issues

**Problem**: "Motion lag or stuttering"
- **Solution**: Reduce motion history size
- **Solution**: Increase motion smoothing
- **Solution**: Check network connection quality

## Development Notes

### Code Structure

The DSU implementation consists of several key components:

1. **DSUClient.cs**: Handles UDP communication with DSU servers
2. **MotionGestureDetector.cs**: Processes motion data and detects gestures
3. **PlayerInputManager.cs**: Integrates motion controls with game input
4. **BowlingBall.cs**: Applies motion data to bowling physics
5. **DSUConfiguration.cs**: Manages configuration settings

### Adding New Sports

To add motion controls to new sports:

1. Subscribe to `PlayerInputManager.OnMotionThrow` event
2. Implement sport-specific motion interpretation
3. Use `MotionGestureDetector` for gesture recognition
4. Apply motion data to game physics appropriately

### Custom Gestures

To add new gesture types:

1. Add new enum value to `MotionGesture`
2. Implement detection logic in `MotionGestureDetector`
3. Handle new gesture in `PlayerInputManager`
4. Update sport-specific handlers as needed

## Network Protocol Details

### DSU Packet Structure

DSU uses UDP packets with the following structure:
- Magic: "DSUC" (client) / "DSUS" (server)
- Version: 1001
- Data Length: Variable
- CRC32: Checksum
- Client ID: Unique identifier
- Message Type: Command/response type
- Data: Motion sensor data

### Message Types

- `DSUC_VERSIONREQ` (0x100000): Version request
- `DSUS_VERSION` (0x100000): Version response
- `DSUC_PADDATAREQ` (0x100002): Motion data request
- `DSUS_PADDATARSP` (0x100002): Motion data response

## Future Enhancements

### Planned Features

- **Multi-device support**: Connect multiple controllers for multiplayer
- **Gesture customization**: Allow players to define custom gestures
- **Motion calibration UI**: In-game calibration interface
- **Advanced physics**: More realistic motion-to-physics translation
- **Sport-specific tuning**: Optimized settings for each sport

### Compatibility

- **Tennis**: Racket swing detection and ball placement
- **Golf**: Club swing analysis and power control
- **Boxing**: Punch detection and combo recognition
- **Baseball**: Batting and pitching motions

## Support

For issues or questions about DSU motion controls:

1. Check the troubleshooting section above
2. Enable debug logging to see detailed connection info
3. Test with different devices to isolate hardware issues
4. Report bugs with detailed logs and device information

## Technical Specifications

- **Protocol**: UDP-based DSU (Cemuhook Motion Provider)
- **Default Port**: 26760
- **Data Rate**: ~60Hz (adjustable)
- **Latency**: <50ms typical (network dependent)
- **Supported Platforms**: Windows, macOS, Linux (Unity dependent)
- **Motion Data**: 3-axis accelerometer, 3-axis gyroscope
- **Precision**: 32-bit floating point values