<div align="center">

# 🌸 Seasons Around The World 🌍

### *Experience the beauty of changing seasons across different countries*

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-Educational-green?style=for-the-badge)](LICENSE)

*An interactive Flutter application that brings seasonal transitions to life through stunning visuals and engaging interactions* ✨

[Features](#-features) • [Getting Started](#-getting-started) • [Screenshots](#-preview) • [Customization](#-customization)

</div>

---

## 🎯 Overview

**Seasons Around The World** is an immersive educational app that showcases how nature transforms throughout the year in different parts of the globe. Simply tap any country card to journey through its unique seasonal cycle—from the snowy winters of France to the tropical summers of Cambodia!

> 📋 **Assignment Reference**: See [CHALLENGE WEATHER.pdf](./CHALLENGE%20WEATHER.pdf) for detailed requirements  
> 📐 **Architecture Diagram**: View [diagram.png](./assets/diagram.png) for system design

### Why This App?

- 🎓 **Educational**: Learn about climate patterns across continents
- 🎨 **Beautiful Design**: Carefully crafted visuals for each season
- 🖱️ **Interactive**: Tap-to-cycle mechanism makes exploration fun
- 📱 **Responsive**: Works seamlessly across all devices
- ⚡ **Fast & Smooth**: Built with Flutter for native performance
- 🏗️ **Clean Architecture**: Enum-based design for type safety

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🌍 Multi-Country Support
Explore seasons in:
- **🇫🇷 France**: Starts with Winter
- **🇰🇭 Cambodia**: Starts with Summer

</td>
<td width="50%">

### 🎨 Rich Visuals
Each season features:
- Custom illustrations
- Smooth transitions
- Clean, modern design
- Responsive imagery

</td>
</tr>
<tr>
<td width="50%">

### 🔄 Interactive Experience
- Tap cards to cycle seasons
- Smooth animated transitions
- Responsive touch feedback

</td>
<td width="50%">

### 📱 Modern Design
- Material 3 design system
- Device preview support
- Adaptive layouts
- Clean, minimal interface

</td>
</tr>
</table>

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have:
- ✅ Flutter SDK (3.9.2 or higher)
- ✅ Dart SDK
- ✅ Your favorite IDE (VS Code, Android Studio, or IntelliJ)
- ✅ A device or emulator to run the app

### 📦 Installation

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/w8_weather.git

# 2. Navigate to project directory
cd w8_weather

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

### 🎮 Platform-Specific Commands

```bash
# Run on Linux
flutter run -d linux

# Run on Web
flutter run -d chrome

# Run on Android
flutter run -d android

# Run on iOS (macOS only)
flutter run -d ios
```

### 🔥 Development Shortcuts

While the app is running:
| Key | Action |
|-----|--------|
| `r` | 🔄 Hot reload (instant updates) |
| `R` | 🔁 Hot restart (full restart) |
| `p` | 🎨 Toggle performance overlay |
| `q` | 🚪 Quit application |

---

## 🎨 Preview

### Architecture Overview
![Architecture Diagram](./assets/diagram.png)

### Season Cycle
Both countries cycle through the same four seasons with different starting points:
```
Winter ❄️ → Spring 🌸 → Summer ☀️ → Autumn 🍂 → (repeat)
```

- **France**: Starts with **Winter** ❄️
- **Cambodia**: Starts with **Summer** ☀️

---

## � Project Architecture

```
w8_weather/
│
├── 📱 lib/
│   ├── main.dart                        # App entry & core UI
│   └── activity_5_dicount_correction.dart  # Reference code
│
├── 🎨 assets/
│   ├── winter.png                       # ❄️ Winter illustration
│   ├── spring.png                       # 🌸 Spring illustration
│   ├── summer.png                       # ☀️ Summer illustration
│   └── fall.png                         # 🍂 Autumn illustration
│
├── 📋 pubspec.yaml                      # Dependencies & assets
└── 📖 README.md                         # You are here!
```

---

## 🎓 Technical Implementation

### Widget Hierarchy

```dart
MaterialApp (DevicePreview enabled)
└── SeasonHomePage (Stateless)
    └── SeasonCard (Stateful) x2
        ├── enum Season (winter, spring, summer, autumn)
        └── State Management (int currentSeason)
```

### Architecture Highlights

This app uses a **simplified enum-based architecture** for type safety and maintainability:

```dart
// Enum with computed properties
enum Season {
  winter, spring, summer, autumn;
  
  String get displayName { ... }   // "Winter", "Spring", etc.
  String get imagePath { ... }     // "assets/winter.png", etc.
  Season get next { ... }          // Cycles to next season
}
```

### State Management Strategy

| Component | Type | Purpose | Example |
|-----------|------|---------|---------|
| `currentSeason` | **State (int)** | Tracks active season index (0-3) | `0` = Winter |
| `season` | **Parameter (enum)** | Initial season for the card | `Season.winter` |
| `imagePath` | **Parameter (String)** | Path to season image | `'assets/winter.png'` |
| `city` | **Parameter (String)** | City/country name | `'FRANCE'` |
| `displayedSeason` | **Computed (enum)** | Current season from index | `Season.values[currentSeason]` |
| `seasonImage` | **Computed (String)** | Current image path | `displayedSeason.imagePath` |

### Key Features Implementation

- ✅ **Enum-Based Design**: Type-safe season representation with computed properties
- ✅ **Tap Cycling**: `GestureDetector` + `setState()` updates `currentSeason`
- ✅ **Smooth Animations**: `AnimatedContainer` with `Curves.easeInOut`
- ✅ **Responsive Layout**: `Expanded` & `Flex` widgets for adaptability
- ✅ **Asset Loading**: `Image.asset` with `BoxFit.cover` for perfect fit
- ✅ **Theme Integration**: Material 3 color schemes
- ✅ **Device Preview**: Multi-device testing support

---

## 🛠️ Customization Guide

### 🌏 Adding a New Country

With the enum-based design, adding a new country is simple:

```dart
// In SeasonHomePage, add another SeasonCard
Expanded(
  child: SeasonCard(
    season: Season.spring,           // Choose starting season
    imagePath: 'assets/spring.png',  // Initial image
    city: 'JAPAN',                   // City/country name
  ),
),
```

### 🎨 Adding Custom Seasons

To add custom seasonal images:

1. **Add images** to `assets/` folder (e.g., `japan_spring.png`)
2. **Update** `pubspec.yaml` if needed
3. **Pass the path** to `SeasonCard`:
   ```dart
   SeasonCard(
     season: Season.spring,
     imagePath: 'assets/japan_spring.png',  // Custom image
     city: 'TOKYO',
   )
   ```

Note: The card will still cycle through the four standard seasons using the enum's `imagePath` getter after the first tap.

### ⚙️ Adjusting Animation Speed

```dart
// In SeasonCard build method (line ~155)
AnimatedContainer(
  duration: const Duration(milliseconds: 200),  // Current
  // Change to:
  duration: const Duration(milliseconds: 300),  // Slightly slower
  // or
  duration: const Duration(milliseconds: 100),  // Faster
  curve: Curves.easeInOut,
)
```

### 🔄 Modifying Season Order

To change which seasons are included or their order, modify the `Season` enum:

```dart
enum Season {
  spring, summer, autumn, winter;  // Different order
  // Update imagePath getter accordingly
}
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8

dev_dependencies:
  device_preview: ^1.1.0  # Multi-device preview
  flutter_lints: ^5.0.0   # Code quality
```

---

## 🎯 Assignment Requirements

This project fulfills all homework criteria as defined in [CHALLENGE WEATHER.pdf](./CHALLENGE%20WEATHER.pdf):

### ✅ Step 1: Widget Identification
- **`SeasonCard`** (Stateful) - Manages season cycling with tap interaction
- **`SeasonHomePage`** (Stateless) - Main layout structure
- **`Season`** (Enum) - Type-safe season representation with computed properties

### ✅ Step 2: Data Classification

Follows the architecture shown in [diagram.png](./assets/diagram.png):

| Data Type | Variable | Description |
|-----------|----------|-------------|
| **State** | `currentSeason: int` | Mutable index (0-3) that triggers rebuilds when changed |
| **Parameter** | `season: Season` | Enum - initial season passed to widget |
| **Parameter** | `imagePath: String` | Initial image path for the season |
| **Parameter** | `city: String` | City/country name for display |
| **Computed** | `displayedSeason: Season` | Derived from `Season.values[currentSeason]` |
| **Computed** | `seasonImage: String` | Derived from `displayedSeason.imagePath` |
| **Constant** | `seasonsTitle: String` | Static "SEASONS" label |

### ✅ Step 3: Implementation
- ✅ Fully functional tap-to-cycle mechanism using `GestureDetector` + `setState()`
- ✅ Smooth visual transitions with `AnimatedContainer`
- ✅ Clean, maintainable enum-based architecture
- ✅ Responsive design with `Expanded` widgets
- ✅ Type-safe season management
- ✅ Device preview support for testing

---

## 💡 Learning Outcomes

By exploring this project, you'll understand:

- 📚 **State Management**: How to use `setState()` with integer indices
- 🎨 **Custom Widgets**: Creating reusable, parameterized `StatefulWidget` components
- 🔄 **Animations**: Implementing smooth transitions with `AnimatedContainer`
- 📐 **Responsive Design**: Building adaptive layouts with `Expanded` and `Flex`
- 🖼️ **Asset Management**: Loading and displaying images efficiently
- 🎭 **Material Design**: Applying Material 3 principles with theme integration
- 🏗️ **Enum Design Patterns**: Using enums with computed properties for type safety
- 🧮 **Computed Values**: Deriving display data from state variables
- 🔁 **Cyclic State**: Implementing circular navigation through modulo arithmetic

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. 🍴 Fork the repository
2. 🌿 Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. 💾 Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push to the branch (`git push origin feature/AmazingFeature`)
5. 🎉 Open a Pull Request

---

## 🌟 Acknowledgments

- 🎨 Illustrations inspired by seasonal beauty worldwide
- 📚 Built as part of Flutter development coursework
- 💙 Thanks to the Flutter community for excellent documentation

---

## 📄 License

This project is created for **educational purposes** as part of a Flutter development course at CADT.

---

<div align="center">

### Made with ❤️ using Flutter

**If you found this project helpful, give it a ⭐!**

[⬆ Back to Top](#-seasons-around-the-world-)

</div>
# W8-CHALLENGE-Weather
