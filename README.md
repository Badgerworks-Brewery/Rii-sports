# Rii Sports

Rii Sports is an open-source project aiming to recreate and enhance the classic **Wii Sports** and **Wii Fit** games for modern platforms. By leveraging the original game code and assets through emulation, decompilation, recompilation and imitation, we strive to offer an improved and nostalgic gaming experience that surpasses modern alternatives like Nintendo's Switch Sports (which may also be added as the years go by).

## 🎮 New Feature: Control Accessories

Rii Sports now includes a comprehensive **Control Accessories** system that enhances the gaming experience with multiple input options and advanced control management!

### Enhanced Input Options
- **Traditional Gamepad Support**: Xbox, PlayStation, and generic controllers with haptic feedback
- **Controller Visualization**: Real-time visual feedback showing controller status and orientation
- **Advanced UI System**: Comprehensive control panel for managing all input devices
- **Calibration Wizard**: Step-by-step setup for optimal motion control performance

### Key Features
- **Multi-Controller Support**: Seamlessly switch between motion controls, gamepad, and keyboard
- **Visual Feedback**: See your controller status, battery level, and connection quality
- **Haptic Feedback**: Controller vibration for enhanced immersion
- **Advanced Calibration**: Precision tuning for motion controls
- **Accessibility Options**: Multiple input methods for different user needs

For detailed setup instructions, see our [Control Accessories Guide](docs/Control_Accessories_Guide.md).

## 🎮 New Feature: DSU Motion Controls

Rii Sports now supports **DSU (Cemuhook Motion Provider protocol)** for authentic Wii Sports-style motion controls! Use your smartphone, DualShock 4 controller, or other motion-capable devices as a Wiimote for realistic bowling, tennis, and other sports gameplay.

### Quick Setup for Motion Controls

1. **Install a DSU app** on your smartphone (like "cemuhook-android") or enable DSU in DS4Windows for DualShock 4
2. **Connect to the same Wi-Fi network** as your computer
3. **Start the DSU server** on your device (default port: 26760)
4. **Launch Rii Sports** and enable motion controls in the settings
5. **Start bowling** with realistic swing motions!

For detailed setup instructions, see our [DSU Motion Controls Guide](docs/DSU_Motion_Controls_Guide.md).

## Project Goal

Our goal is to port the beloved games from the Wii Sports and Wii Fit series to modern devices, combining them into one comprehensive game built with a modern engine. This project seeks to preserve the charm of the original games while making them accessible on contemporary hardware, ensuring a seamless and enhanced experience for fans and new players alike.

## Features

### ✅ Currently Implemented
- **Bowling Game**: Physics-based bowling with pin collision
- **Motion Controls**: DSU protocol support for authentic Wii-style motion input
- **Control Accessories**: Enhanced input system with gamepad support, controller visualization, and advanced UI
- **Keyboard Controls**: Traditional keyboard input as fallback
- **Event System**: Modular event-driven architecture
- **Audio System**: Sound effects and music management
- **Scene Management**: Loading screens and scene transitions

### 🚧 In Development
- **Tennis**: Racket swing detection and ball physics
- **Golf**: Club swing analysis and ball trajectory
- **Boxing**: Punch detection and combo system
- **Baseball**: Batting and pitching mechanics

### 📋 Planned Features
- **Multiplayer Support**: Local and online multiplayer
- **Mii Integration**: Character customization system
- **Achievement System**: Unlock rewards and track progress
- **Tournament Mode**: Competitive gameplay modes
- **VR Support**: Virtual reality motion controls

## Technologies

The project is being developed using **Unity** as the primary game engine. It utilizes the Wii Sports decompilation ([doldecomp/ogws](https://github.com/doldecomp/ogws)) and references emulators like **Dolphin**, **Cemu**, or **Suyu** to help run the original game code. To avoid legal issues, users must provide their own ROM files for the games.

### Motion Control Technology
- **DSU Protocol**: UDP-based motion data transmission
- **Gesture Recognition**: AI-powered motion pattern detection
- **Multi-device Support**: Smartphones, controllers, and custom hardware
- **Real-time Processing**: Low-latency motion interpretation

## Getting Started

To get started with Rii Sports, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Badgerworks-Brewery/Rii-sports.git
   ```
2. **Open in Unity** (2022.3 LTS or newer recommended)
3. **Set up motion controls** (optional but recommended):
   - Install DSU app on your smartphone or enable DS4Windows motion support
   - Configure network settings in PlayerInputManager
   - Test connection and calibrate sensitivity

## Requirements

### Software Dependencies
- **Unity 2022.3 LTS** or newer
- **Git** for version control
- **DSU Motion Provider** (optional, for motion controls):
  - Smartphone with DSU app (Android/iOS)
  - DualShock 4 with DS4Windows
  - Nintendo Switch Pro Controller with specialized software

### Hardware Requirements
- **Minimum**:
  - 4 GB RAM
  - Dual-core CPU
  - GPU supporting OpenGL 3.0 or higher
  - Network connection (for motion controls)
- **Recommended**:
  - 8 GB RAM
  - Quad-core CPU
  - Dedicated GPU
  - Wi-Fi 5 or better (for optimal motion control latency)

### Motion Control Setup
For the best motion control experience:
- **Smartphone**: Modern device with gyroscope and accelerometer
- **Network**: Low-latency Wi-Fi connection (same network as computer)
- **Space**: Room to swing naturally (similar to original Wii setup)

## Controls

### Keyboard Controls (Default)
- **Space**: Throw/Hit/Swing
- **T**: Test throw (debug mode)
- **R**: Reset motion controls (debug mode)

### Motion Controls (DSU)
- **Bowling**: Natural bowling swing motion
- **Tennis**: Racket swing motions (coming soon)
- **Golf**: Club swing motions (coming soon)

### Gamepad Controls (New!)
- **A/X Button (Hold)**: Charge throw power
- **Left Stick**: Aim direction
- **Right Trigger**: Alternative power control
- **Start/Options**: Open control accessories panel
- **Haptic Feedback**: Controller vibration for actions

## Configuration

### Motion Control Settings
Access motion control settings through the PlayerInputManager component:
- **Motion Sensitivity**: Adjust overall motion responsiveness
- **Swing Threshold**: Minimum motion required for gesture detection
- **Force Multiplier**: How motion translates to in-game force
- **Debug Mode**: Enable detailed motion logging

### Network Configuration
- **Server IP**: IP address of your motion device
- **Server Port**: DSU communication port (default: 26760)
- **Auto Connect**: Automatically connect to DSU server on startup

## Contributing

We are currently in a *Help-Wanted*-induced hiatus so we welcome contributions from anyone! Whether you're a developer, designer, or tester, your help is valuable in making Rii Sports the best it can be.

### Areas Where We Need Help
- **Motion Control Tuning**: Calibrating gesture detection for different sports
- **UI/UX Design**: Creating intuitive interfaces for motion control setup
- **Testing**: Testing motion controls with various devices and network conditions
- **Documentation**: Improving setup guides and troubleshooting resources
- **Sports Implementation**: Adding new sports with motion control support

### Development Guidelines
1. Follow Unity coding conventions
2. Test motion controls with multiple devices
3. Document new features thoroughly
4. Maintain backward compatibility with keyboard controls
5. Consider accessibility in motion control design

## Troubleshooting

### Motion Control Issues
- **Can't connect**: Check network settings and firewall
- **Laggy motion**: Reduce motion history size or improve Wi-Fi
- **Gestures not detected**: Adjust sensitivity and swing thresholds
- **Inconsistent throws**: Calibrate motion controls and check device orientation

For detailed troubleshooting, see the [DSU Motion Controls Guide](docs/DSU_Motion_Controls_Guide.md).

## Legal Disclaimer

This project is for **non-commercial purposes only**. All original game assets and code are the property of their respective owners (e.g., Nintendo) and are not provided by the developers of this project in the Executable you download. Users must own a legal copy of the games and provide their own ROM files to use this software. The project does not distribute any copyrighted materials.

## Acknowledgments

- **Nintendo**: For creating the original Wii Sports games
- **Cemuhook Team**: For developing the DSU motion protocol
- **doldecomp/ogws**: For Wii Sports decompilation efforts
- **Unity Technologies**: For the game engine
- **Community Contributors**: For testing, feedback, and development support

---

*Experience the nostalgia of Wii Sports with modern motion controls!*

