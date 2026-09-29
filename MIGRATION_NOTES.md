# Flutter stable migration notes

Updated on 2026-09-29 to the latest stable Flutter release available at the time: **Flutter 3.47.5**, bundled with **Dart 3.13.4**.

## Changes

- Raised the Dart SDK floor to 3.13.4 and refreshed direct dependencies: `cupertino_icons` 2.0, `intl` 0.20, `uuid` 4.6, and `flutter_lints` 6.
- Normalized Android to one Kotlin Gradle DSL configuration matching Flutter 3.47.5's generated template: Android Gradle Plugin 9.1.0, Kotlin 2.4.0, and Gradle 9.3.1.
- Standardized Android compilation on Java 17 and Flutter-managed compile/target SDK values; removed duplicate legacy Groovy files and machine-specific `local.properties`.
- Raised the iOS deployment target to 15.0 to match the Flutter 3.47.5 app template.
- Replaced deprecated color-opacity calls, fixed an overflowing chart label row, and replaced the unrelated starter-counter test with a dashboard smoke test.
- Removed machine-generated caches and ephemeral files from the project bundle; Flutter regenerates these locally.

## Run and verify

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Validation performed

- `flutter analyze`: passed with no issues.
- `flutter test`: passed (dashboard and narrow-screen regression tests).
- `flutter build web --release`: succeeded.
- Gradle wrapper: launched Gradle 9.3.1 successfully on JDK 21. The sandbox has no Android SDK, so an Android APK build was not run.

Use JDK 17+ for Android. Flutter regenerates `android/local.properties` with the local SDK path when a Flutter command is run. The iOS target requires Xcode and iOS 15+.
