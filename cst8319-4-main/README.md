# StressLess

This is a Flutter application designed to help caregivers practice emotionally supportive responses based on Emotion-Focused Family Therapy (EFFT).

## Directory Structure

```
.
├── android
├── ios
├── lib
│   ├── data
│   │   └── scenario_data.dart
│   ├── models
│   │   ├── models.dart
│   │   └── session.dart
│   ├── screens
│   │   ├── about_screen.dart
│   │   ├── home_screen.dart
│   │   ├── home_screen_new.dart
│   │   ├── learn_screen.dart
│   │   ├── main_screen.dart
│   │   ├── practice_screen.dart
│   │   ├── scenario_list_screen.dart
│   │   ├── script_builder_screen.dart
│   │   ├── script_screen.dart
│   │   ├── session_screen.dart
│   │   ├── settings_screen.dart
│   │   └── steps
│   │       ├── step_automatic_response.dart
│   │       ├── step_emotional_support.dart
│   │       ├── step_knee_jerk_reaction.dart
│   │       ├── step_practical_support.dart
│   │       └── step_validation.dart
│   ├── widgets
│   │   ├── emotion_badge.dart
│   │   └── shared_widgets.dart
│   ├── main.dart
│   ├── main_screen.dart
│   └── theme.dart
├── linux
├── macos
├── test
│   └── widget_test.dart
├── web
├── windows
├── .gitignore
├── analysis_options.yaml
├── app_content.txt
├── blueprint.md
├── blueprint.txt
├── devtools_options.yaml
├── flutter_native_splash.yaml
├── pubspec.lock
└── pubspec.yaml
```

## Implementation Instructions

### Prerequisites
cd
*   Flutter SDK: Make sure you have the Flutter SDK installed and configured properly.
*   Dart: Dart is included with Flutter.

### Running the App

1.  Extract the zip file containing the project.

2.  Navigate to the project directory:

    ```
    cd stressless
    ```

3.  Get the dependencies:

    ```
    flutter pub get
    ```

4.  Run the app:

    ```
    flutter run
    ```

## Transition to Production

### Building the App for Production

To build the app for production, you can use the following Flutter commands:

*   **Android:**

    ```
    flutter build apk --release
    ```

    This will create a release APK file in the `build/app/outputs/apk/release` directory.

*   **iOS:**

    ```
    flutter build ios --release
    ```

    This will create a release build for iOS. You will need to have a paid Apple Developer account to build and deploy to iOS devices.

*   **Web:**

    ```
    flutter build web
    ```

    This will create a `build/web` directory with the production-ready web app.

### Deployment

*   **Android:** You can upload the release APK to the Google Play Store.
*   **iOS:** You can upload the release build to the Apple App Store.
*   **Web:** You can deploy the `build/web` directory to any web hosting service.

## Testing the Installation

After installing the app on a device or deploying the web app, you should test the following:

*   **App launch:** The app should launch without crashing.
*   **Navigation:** You should be able to navigate between all the screens.
*   **Functionality:** All the features of the app should work as expected. This includes:
    *   Starting a practice session.
    *   Viewing the learn content.
    *   Building a script with the script builder.
    *   Viewing the about screen.
    *   Changing the settings.

By following these instructions, you should be able to successfully implement, deploy, and test the StressLess application.
