# FitSpace

<div align="center">
  <img src="assets/fitspace_logo.png" alt="FitSpace Logo" width="200"/>
  <h3>Your Personal Fitness Journey, Reimagined</h3>
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.19.0-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.3.0-blue.svg)](https://dart.dev/)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey.svg)](https://flutter.dev/)
  
</div>

## 🚀 Overview

FitSpace is a sophisticated fitness companion built with Flutter that transforms how you track, analyze, and improve your fitness journey. With advanced analytics, personalized workout recommendations, and high-quality training videos, FitSpace brings professional fitness guidance to your pocket.

### ✨ Key Features

- **Comprehensive Fitness Analytics**: Track over 30 metrics including workout intensity, recovery patterns, and progress trends
- **AI-Powered Recommendations**: Personalized workout suggestions based on your performance data and goals
- **HD Training Library**: Access to 500+ professionally produced workout videos with detailed instructions
- **Real-time Progress Tracking**: Visual representations of your fitness journey with interactive charts and heatmaps
- **Custom Workout Builder**: Create and save personalized routines with our intuitive drag-and-drop interface
- **Community Challenges**: Participate in global fitness challenges and compete on leaderboards
- **Offline Mode**: Download videos and workout plans for training without internet connection
- **Wearable Integration**: Sync with popular fitness wearables for comprehensive health data collection

## 📱 Screenshots

<div align="center">
  <img src="assets/screenshots/dashboard.png" width="200"/>
  <img src="assets/screenshots/analytics.png" width="200"/>
  <img src="assets/screenshots/video_player.png" width="200"/>
  <img src="assets/screenshots/workout_planner.png" width="200"/>
</div>

## 🛠️ Technology Stack

FitSpace leverages cutting-edge technologies to deliver a seamless fitness experience:

- **Frontend**: Flutter 3.19.0 with Material Design 3 and custom animations
- **State Management**: Riverpod 2.4.0 for reactive and testable state management
- **Analytics Engine**: Custom-built analytics system using TensorFlow Lite for on-device processing
- **Video Streaming**: Optimized video delivery with adaptive bitrate streaming
- **Database**: Firebase Firestore for cloud storage with local SQLite caching
- **Authentication**: Secure multi-factor authentication with biometric options
- **API Integration**: RESTful API communication with fitness data providers
- **Testing**: Comprehensive unit, widget, and integration testing with 90%+ coverage

## 📊 Architecture

FitSpace follows a clean architecture approach with clear separation of concerns:

```
lib/
├── core/                 # Core utilities, constants, and base classes
├── data/                 # Data layer with repositories and data sources
├── domain/               # Business logic and entities
├── presentation/         # UI components and screens
│   ├── analytics/        # Statistics and progress tracking
│   ├── training/         # Video library and playback
│   ├── planning/         # Workout planning and scheduling
│   └── profile/          # User profile and settings
├── services/             # External services integration
└── main.dart             # Application entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter 3.19.0 or higher
- Dart 3.3.0 or higher
- Android Studio / VS Code with Flutter extensions
- iOS 14+ / Android 8.0+

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/fitspace.git
   cd fitspace
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Configure environment variables
   ```bash
   cp .env.example .env
   # Edit .env with your API keys
   ```

4. Run the application
   ```bash
   flutter run
   ```

## 🧪 Testing

FitSpace maintains high code quality through comprehensive testing:

```bash
# Run all tests
flutter test

# Run with coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 📈 Performance Optimizations

FitSpace implements several performance optimizations:

- **Lazy Loading**: Videos and heavy assets are loaded on-demand
- **Memory Management**: Automatic resource disposal when navigating between screens
- **Image Caching**: Efficient image caching to reduce network requests
- **Computation Isolation**: Heavy calculations run on separate isolates to maintain UI responsiveness
- **Render Optimization**: Custom render objects for complex UI components

## 🔒 Privacy & Security

- End-to-end encryption for user data
- Compliance with GDPR and CCPA regulations
- Optional anonymized analytics for app improvement
- Secure local storage for sensitive information

## 🌐 Internationalization

FitSpace supports 12 languages including:
- English
- Spanish
- French
- German
- Chinese (Simplified)
- Japanese
- Portuguese
- Russian


## 📄 License

FitSpace is released under the MIT License. See the [LICENSE](LICENSE) file for details.

## 📬 Contact

- **Website**: [fitspace.app](https://fitspace.app)
- **Email**: support@fitspace.app
- **Twitter**: [@FitSpaceApp](https://twitter.com/FitSpaceApp)

---

<div align="center">
  <p>Built with ❤️ by Tobias</p>
  <p>© 2023 GRLSTUDIO. All rights reserved.</p>
</div>
