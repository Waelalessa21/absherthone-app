# Absherthone - Fraud Detection App

## Overview
Absherthone is a mobile application designed to protect users from phone scams and fraudulent calls. It uses speech recognition and analysis to detect potentially fraudulent conversations and alerts users to possible scam attempts.

## Features
- **Phone Call Authentication**: Secure login using phone number and OTP verification
- **Fraud Detection**: Analyze voice recordings to identify potential scam patterns
- **Multi-language Support**: Fully localized for both English and Arabic
- **Voice Recording**: Record suspicious calls for analysis
- **Audio Upload**: Upload audio files for fraud detection
- **User Dashboard**: Track detected scam calls and get detailed reports
- **Customizable Settings**: Configure call monitoring and notification preferences

## Getting Started

### Prerequisites
- Flutter SDK (3.5.0+)
- Dart SDK (3.5.4+)
- iOS 13.0+ / Android SDK 21+
- Firebase account for authentication

### Installation
1. Clone the repository:
   ```
   git clone https://github.com/username/absherthone-app.git
   cd absherthone-app
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Configure Firebase:
   - Add your `GoogleService-Info.plist` for iOS
   - Add your `google-services.json` for Android

4. Run the app:
   ```
   flutter run
   ```

## Project Structure
```
lib/
├── common/            # Common utilities, widgets, and helpers
│   ├── layout/        # Layout components
│   ├── provider/      # State management providers
│   ├── routing/       # Navigation and routing
│   ├── widgets/       # Shared UI components
│   └── helper/        # Helper functions
├── features/          # App features organized by domain
│   ├── login/         # Authentication feature
│   ├── onBoarding/    # Onboarding screens
│   ├── record/        # Voice recording functionality
│   ├── report/        # Reporting and history
│   └── settings/      # User settings
├── l10n/              # Localization resources
├── main.dart          # App entry point
└── absherthone_app.dart # Main app configuration
```

## Authentication Flow
The app uses Firebase Phone Authentication for secure user verification:
1. User enters phone number and name
2. OTP is sent to the provided number
3. User verifies identity by entering the OTP code
4. Upon successful verification, user information is stored and the user is logged in

## Localization
The app supports both English and Arabic languages. Localization files are stored in the `lib/l10n` directory.

## Technologies Used
- **Flutter**: UI framework
- **Firebase**: Authentication and backend services
- **Provider**: State management
- **Speech-to-Text**: Voice recognition
- **Flutter Localizations**: Multi-language support

## Future Enhancements
- Real-time call monitoring
- Machine learning-based fraud detection
- Integration with official banking APIs for verification
- Community-reported scam database

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements
- Flutter team for the wonderful framework
- Firebase for authentication services
- All contributors who have helped shape this project
