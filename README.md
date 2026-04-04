# Sukoon

Sukoon is an emotional wellness application focused on helping students manage stress, track habits, and build healthier digital routines.

This repository currently contains:
- The primary Flutter mobile application
- A premium React/Vite frontend prototype used for rapid UI iteration

## Core Capabilities

- Onboarding flow with personalized name capture
- Mood check-in experience
- Journal and reflection interfaces
- Habit tracking with persisted completion history, streaks, and progress rates
- Detox tracking with daily usage details, session logging, points, and trends
- Offline-first architecture for the mobile app

## Repository Layout

- `lib/`: Flutter application source
- `android/`: Android build and Gradle configuration for Flutter app
- `ios/`: iOS project files for Flutter app
- `assets/`: Shared media and Lottie/audio assets
- `Sukoon/`: React + Vite frontend prototype
- `test/`: Flutter tests

## Technology Stack

### Mobile App
- Flutter 3.41.x
- Dart 3.11.x
- Riverpod for state management
- Isar for local persistence

### Frontend Prototype
- React 19
- Vite 6
- TypeScript
- Tailwind CSS
- Motion (`motion/react`) for interactions

## Prerequisites

- Flutter SDK available locally
- Android SDK installed for APK builds
- Node.js and npm for web prototype
- GitHub CLI (`gh`) for release automation

Recommended Java for Android/Gradle in this project:
- Java 21 (for example: `21.0.9-ms`)

## Local Setup

### Flutter App

```bash
cd /workspaces/Sukoon
/home/codespace/flutter/bin/flutter pub get
/home/codespace/flutter/bin/flutter run
```

### Web Prototype

```bash
cd /workspaces/Sukoon/Sukoon
npm install
npm run dev
```

If you are running in Codespaces, open the forwarded URL after the dev server starts.

## Build Android APK

```bash
cd /workspaces/Sukoon
export JAVA_HOME=/usr/local/sdkman/candidates/java/21.0.9-ms
export PATH="$JAVA_HOME/bin:/home/codespace/flutter/bin:$PATH"
flutter pub get
flutter build apk --release
```

Output APK:
- `build/app/outputs/flutter-apk/app-release.apk`

## Update GitHub Release APK

Replace the existing release asset with a newly built APK:

```bash
cd /workspaces/Sukoon
gh release upload "v1.0.0+1-r2" build/app/outputs/flutter-apk/app-release.apk#app-release.apk --clobber
```

To inspect release assets:

```bash
gh api repos/Waqar-743/Sukoon/releases/305133270 --jq '{assets: [.assets[] | {name, size, updated_at}]}'
```

## Troubleshooting

### Gradle/Android Build Error with Java `25.0.1`

If build fails with a Kotlin/Gradle parse error like `25.0.1`, switch to Java 21 before building:

```bash
export JAVA_HOME=/usr/local/sdkman/candidates/java/21.0.9-ms
export PATH="$JAVA_HOME/bin:$PATH"
```

### Codespaces Forwarded URL Returns 404

Use tunnel bootstrap once:

`https://<codespace-name>-3000.app.github.dev/?tunnel=1`

Then refresh the normal app URL in the same browser session.

### Scrolling Issues in Web UI

The app uses dedicated scroll containers (`scrollable-panel`) on long screens. If scroll appears stuck, hard refresh the page and ensure the latest dev server is running.

## Notes

- This project is under active iteration.
- Web prototype and Flutter app may progress at different speeds during UI experiments.

