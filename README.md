# Expense Tracker

A small cross-platform Flutter app for recording expenses and viewing category totals as a chart.

## Requirements

- Flutter **3.47.5** (stable) or newer stable
- Dart **3.13.4** (bundled with Flutter)
- Android Studio/Xcode and a device or emulator for the corresponding platform

## Run

```bash
flutter pub get
flutter run
```

## Verify

```bash
flutter analyze
flutter test
```

The Android project uses the Kotlin Gradle DSL and requires JDK 17 or newer. Flutter creates the machine-specific `android/local.properties` file when you run Flutter commands; it is intentionally not checked into the project.

## Features

- Add expenses with a title, amount, date, and category
- Responsive dashboard and category chart
- Delete expenses with an undo action
