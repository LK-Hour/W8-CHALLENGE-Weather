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

**Seasons Around The World** is an immersive educational app that showcases how nature transforms throughout the year in different parts of the globe. Simply tap any country card to journey through its unique seasonal cycle—from the snowy winters of France to the monsoon rains of Cambodia!

### Why This App?

- 🎓 **Educational**: Learn about climate patterns across continents
- 🎨 **Beautiful Design**: Carefully crafted color palettes for each season
- 🖱️ **Interactive**: Tap-to-cycle mechanism makes exploration fun
- 📱 **Responsive**: Works seamlessly across all devices
- ⚡ **Fast & Smooth**: Built with Flutter for native performance

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🌍 Multi-Country Support
Explore seasons in:
- **🇫🇷 France**: Classic European seasons
- **🇰🇭 Cambodia**: Tropical climate zones

</td>
<td width="50%">

### 🎨 Rich Visuals
Each season features:
- Custom illustrations
- Unique color schemes
- Descriptive narratives
- Month indicators

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

### France Seasons
```
Winter ❄️ → Spring 🌸 → Summer ☀️ → Autumn 🍂
```

### Cambodia Seasons
```
Cool & Dry 🌤️ → Hot 🔥 → Rainy 🌧️ → Transition 🌾
```

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
MaterialApp
└── SeasonHomePage (Stateless)
    └── SeasonCard (Stateful) x2
        ├── Season Model
        └── State Management
```

### State Management Strategy

| Component | Type | Purpose |
|-----------|------|---------|
| `_currentIndex` | **State** | Tracks active season index |
| `country` | **Parameter** | Country name display |
| `seasons` | **Parameter** | List of season data |
| `initialIndex` | **Parameter** | Starting season |
| `effectiveSeason` | **Computed** | Current season based on index |

### Key Features Implementation

- ✅ **Tap Cycling**: `GestureDetector` + `setState()`
- ✅ **Smooth Animations**: `AnimatedContainer` with curves
- ✅ **Responsive Layout**: `Expanded` & `Flex` widgets
- ✅ **Asset Loading**: Image.asset with cover fit
- ✅ **Theme Integration**: Material 3 color schemes

---

## 🛠️ Customization Guide

### 🌏 Adding a New Country

```dart
// 1. Define season data
const List<Season> japanSeasons = [
  Season(
    name: 'Spring (Haru)',
    imageAsset: 'assets/japan_spring.png',
    backgroundColor: Color(0xFFFFB7C5),
    foregroundColor: Colors.white,
    description: 'Cherry blossoms paint the country pink.',
    months: 'March – May',
  ),
  // Add more seasons...
];

// 2. Add to UI
SeasonCard(
  country: '🇯🇵 Japan',
  seasons: japanSeasons,
  initialIndex: 0,
),
```

### 🎨 Customizing Colors

```dart
// Modify backgroundColor for card appearance
backgroundColor: Color(0xFF123456),  // Dark blue
backgroundColor: Color(0xFFFFB347),  // Warm orange
backgroundColor: Color(0xFF51A37A),  // Fresh green
```

### 🖼️ Using Custom Images

1. Add your images to `assets/` folder
2. Update `pubspec.yaml` if needed
3. Reference in Season model:
   ```dart
   imageAsset: 'assets/your_image.png'
   ```

### ⚙️ Adjusting Animation Speed

```dart
// In SeasonCard build method
AnimatedContainer(
  duration: const Duration(milliseconds: 300),  // Faster
  // or
  duration: const Duration(milliseconds: 500),  // Slower
)
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

This project fulfills all homework criteria:

### ✅ Step 1: Widget Identification
- `SeasonCard` (Stateful) - Manages season cycling
- `SeasonHomePage` (Stateless) - Layout structure
- `Season` (Model) - Data encapsulation

### ✅ Step 2: Data Classification
- **State**: `_currentIndex` (mutable, triggers rebuilds)
- **Parameters**: `country`, `seasons`, `initialIndex`
- **Computed**: Current season selection
- **Constants**: Season data arrays

### ✅ Step 3: Implementation
- Fully functional tap-to-cycle mechanism
- Smooth visual transitions
- Clean, maintainable code structure
- Responsive design patterns

---

## 💡 Learning Outcomes

By exploring this project, you'll understand:

- 📚 **State Management**: How to use `setState()` effectively
- 🎨 **Custom Widgets**: Creating reusable, parameterized components
- 🔄 **Animations**: Implementing smooth transitions
- 📐 **Responsive Design**: Building adaptive layouts
- 🖼️ **Asset Management**: Working with images in Flutter
- 🎭 **Material Design**: Applying Material 3 principles

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
