# Control Accessories Guide for Rii Sports

## Overview

Rii Sports now features an enhanced control system with multiple input accessories that provide players with various ways to enjoy the game. This guide covers the new control accessories and how to use them effectively.

## New Control Accessories

### 1. Gamepad Input Accessory

The **GamepadInputAccessory** provides traditional gamepad support alongside motion controls, offering precise button-based alternatives to motion gestures.

#### Features:
- **Charge-based throwing**: Hold and release buttons for power control
- **Analog aiming**: Use left stick for precise directional control
- **Haptic feedback**: Controller vibration for enhanced immersion
- **Multiple gamepad support**: Works with Xbox, PlayStation, and generic controllers

#### Controls:
- **A/X Button (Hold)**: Charge throw power
- **Left Stick**: Aim direction
- **Right Trigger**: Alternative power control
- **Start/Options**: Access control menu
- **Right Stick**: Camera control (future use)

#### Setup:
1. Connect your gamepad via USB or Bluetooth
2. Open the Control Accessories panel in-game
3. Enable "Gamepad Input" in the settings
4. Adjust sensitivity to your preference
5. Test controls using the built-in test function

### 2. Controller Visualization System

The **ControllerVisualization** component provides real-time visual feedback about your connected controllers.

#### Features:
- **Controller type detection**: Automatically identifies phone, gamepad, or keyboard
- **Connection status**: Visual indicators for connection quality
- **Battery monitoring**: Shows battery level for wireless devices
- **Orientation display**: Real-time controller orientation for motion devices
- **Action feedback**: Visual and audio cues for successful gestures

#### Visual Elements:
- **Controller Icon**: Shows the type of active controller
- **Connection Quality Bar**: Indicates signal strength and latency
- **Battery Indicator**: Displays remaining battery life
- **Orientation Visualizer**: 3D representation of controller orientation
- **Action Effects**: Particle effects and animations for gestures

### 3. Enhanced Control UI

The **ControlAccessoriesUI** provides a comprehensive interface for managing all input devices.

#### Main Features:

##### Controller Selection
- **Auto Detect**: Automatically uses the best available controller
- **Motion Controller Only**: Forces DSU motion controls
- **Gamepad Only**: Uses traditional gamepad input
- **Keyboard Only**: Falls back to keyboard controls

##### Motion Controls Section
- **Enable/Disable Toggle**: Turn motion controls on/off
- **Sensitivity Slider**: Adjust motion responsiveness (0.1x - 5.0x)
- **Calibration Wizard**: Step-by-step motion calibration
- **Test Function**: Verify motion control functionality

##### Gamepad Section
- **Enable/Disable Toggle**: Turn gamepad input on/off
- **Sensitivity Slider**: Adjust gamepad responsiveness
- **Test Function**: Verify gamepad functionality
- **Haptic Settings**: Configure vibration feedback

##### Connection Settings
- **Server IP**: Configure DSU server address
- **Server Port**: Set communication port (default: 26760)
- **Auto Connect**: Automatically connect on startup
- **Manual Connect/Disconnect**: Control connection manually

##### Status Display
- **Connection Status**: Real-time connection information
- **Connection Quality**: Signal strength and stability
- **Latency Display**: Current input lag measurements
- **Diagnostics**: Detailed system information

##### Advanced Settings
- **Gesture Threshold**: Fine-tune motion detection sensitivity
- **Motion Smoothing**: Reduce motion jitter (0-90%)
- **Debug Mode**: Enable detailed logging
- **Reset to Defaults**: Restore original settings

### 4. Calibration Wizard

The built-in calibration wizard helps optimize motion controls for your specific setup.

#### Calibration Steps:
1. **Natural Hold**: Hold controller in comfortable position
2. **Gentle Motion**: Make a light bowling motion
3. **Steady Hold**: Keep controller still for calibration
4. **Strong Motion**: Make a full-power bowling motion
5. **Completion**: Finalize calibration settings

#### Tips for Best Results:
- Ensure good lighting for phone-based motion controls
- Hold device naturally, as you would a real bowling ball
- Make smooth, consistent motions during calibration
- Recalibrate if you change your grip or playing position

## Setup Instructions

### Quick Setup
1. **Launch Rii Sports**
2. **Press the Control Accessories button** (usually in main menu or pause menu)
3. **Select your preferred controller type** from the dropdown
4. **Adjust sensitivity** to your liking
5. **Test controls** using the test buttons
6. **Start playing!**

### Detailed Setup

#### For Motion Controls (DSU):
1. Install DSU app on your smartphone or enable DSU in DS4Windows
2. Connect device to same Wi-Fi network as your computer
3. Note the device's IP address
4. In Rii Sports, open Control Accessories panel
5. Enter the IP address in Connection Settings
6. Click "Connect" and wait for confirmation
7. Run the Calibration Wizard for optimal performance

#### For Gamepad:
1. Connect gamepad via USB or pair via Bluetooth
2. Open Control Accessories panel
3. Enable "Gamepad Input"
4. Adjust sensitivity and test controls
5. Configure haptic feedback if desired

#### For Multiple Controllers (Multiplayer):
1. Connect all desired controllers
2. Set Controller Type to "Auto Detect"
3. Each player can use their preferred input method
4. Controllers are automatically assigned to players

## Troubleshooting

### Common Issues

#### Motion Controls Not Working
- **Check Wi-Fi connection**: Ensure same network for all devices
- **Verify DSU server**: Make sure DSU app is running on phone/controller
- **Check firewall**: Allow port 26760 through firewall
- **Recalibrate**: Run calibration wizard again
- **Restart DSU**: Close and reopen DSU app

#### Gamepad Not Detected
- **Check connection**: Ensure gamepad is properly connected
- **Update drivers**: Install latest gamepad drivers
- **Test in other games**: Verify gamepad works elsewhere
- **Try different USB port**: Some ports may have better compatibility
- **Restart game**: Sometimes requires restart to detect new controllers

#### Poor Motion Accuracy
- **Recalibrate**: Use the calibration wizard
- **Adjust sensitivity**: Lower sensitivity for more precise control
- **Check lighting**: Ensure good lighting for phone sensors
- **Reduce smoothing**: Lower motion smoothing for more responsive controls
- **Check device orientation**: Hold device naturally and consistently

#### High Latency
- **Improve Wi-Fi**: Use 5GHz Wi-Fi for better performance
- **Reduce distance**: Move closer to Wi-Fi router
- **Close other apps**: Reduce network usage on phone/computer
- **Check connection quality**: Monitor connection quality bar
- **Use wired connection**: Consider USB connection for gamepad

### Advanced Troubleshooting

#### Enable Debug Mode
1. Open Control Accessories panel
2. Expand Advanced Settings
3. Enable "Debug Mode"
4. Check console/logs for detailed information

#### Reset All Settings
1. Open Control Accessories panel
2. Click "Reset to Defaults" in Advanced Settings
3. Reconfigure your preferred settings
4. Test all controllers again

#### Diagnostics Information
1. Click "Diagnostics" button in Status Display
2. Review system information in console
3. Share diagnostics with support if needed

## Performance Optimization

### For Best Motion Control Performance:
- Use 5GHz Wi-Fi network
- Keep phone charged above 20%
- Close unnecessary apps on phone
- Ensure stable phone grip
- Play in well-lit environment

### For Best Gamepad Performance:
- Use wired connection when possible
- Keep controllers charged
- Update gamepad drivers regularly
- Adjust sensitivity for your play style

### For Best Overall Performance:
- Enable only the controllers you're using
- Disable debug mode during normal play
- Keep game updated to latest version
- Restart game periodically for optimal performance

## Accessibility Features

### Visual Accessibility:
- High contrast connection status indicators
- Large, clear controller icons
- Color-blind friendly status colors
- Adjustable UI scaling (system dependent)

### Motor Accessibility:
- Adjustable sensitivity for all input types
- Alternative input methods (keyboard, gamepad, motion)
- Customizable gesture thresholds
- Hold-to-charge mechanics for precise control

### Cognitive Accessibility:
- Step-by-step calibration wizard
- Clear visual feedback for all actions
- Comprehensive help documentation
- Diagnostic tools for troubleshooting

## Future Enhancements

### Planned Features:
- **Multi-device multiplayer**: Support for multiple simultaneous controllers
- **Custom gesture creation**: Define your own motion gestures
- **Voice commands**: Voice control integration
- **Eye tracking**: Gaze-based aiming (experimental)
- **VR support**: Virtual reality motion controls

### Community Requests:
- **Controller profiles**: Save and share controller configurations
- **Tournament mode**: Standardized settings for competitive play
- **Accessibility improvements**: Enhanced support for adaptive controllers
- **Mobile companion app**: Dedicated smartphone controller app

## Support

For additional help with control accessories:

1. **Check this guide** for common solutions
2. **Enable debug mode** for detailed information
3. **Run diagnostics** to identify issues
4. **Check community forums** for user solutions
5. **Report bugs** with diagnostic information

## Technical Specifications

### Supported Controllers:
- **Motion**: Smartphones with DSU apps, DualShock 4, Nintendo Switch Pro Controller
- **Gamepad**: Xbox controllers, PlayStation controllers, Generic HID gamepads
- **Keyboard**: Standard QWERTY keyboards
- **Custom**: Any device supporting Unity Input System

### Network Requirements:
- **Protocol**: UDP (DSU)
- **Port**: 26760 (configurable)
- **Latency**: <50ms recommended
- **Bandwidth**: Minimal (<1KB/s per controller)

### System Requirements:
- **Unity Version**: 2022.3 LTS or newer
- **Input System**: Unity Input System package
- **Platform**: Windows, macOS, Linux (Unity dependent)
- **Network**: Wi-Fi or Ethernet for motion controls

---

*Experience Rii Sports with the control method that works best for you!*