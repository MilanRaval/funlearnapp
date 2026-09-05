# FunAtomy 🦴

FunAtomy is a minimalist Flutter application designed to make learning anatomy engaging and consistent. Every day, users are presented with a new, fascinating fact about the human body, accompanied by high-quality diagrams.

## ✨ Features

- **Daily Topic Selection**: Automatically selects a featured anatomy topic based on the current day of the month.
- **Gallery Navigation**: Browse through the entire collection of anatomy facts using intuitive "Previous" and "Next" buttons.
- **Daily Reminders**: Get a push notification every morning at 6:00 AM (local time) to kickstart your day with a new fact.
- **Minimalist Design**: An immersive, edge-to-edge UI that focuses entirely on the content—no distracting top bars or clutter.
- **JSON-Powered Content**: Easily manage and update the curriculum via a simple JSON file in the assets.

## 🛠️ Technical Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: Stateful Widgets & Provider
- **Notifications**: `flutter_local_notifications` with `timezone` support
- **Storage**: Asset-based JSON (`assets/data/topic_of_the_day.json`)
- **UI Design**: Material 3 with a customized edge-to-edge layout

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version recommended)
- Android Studio / VS Code
- A physical device or emulator

### Installation

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd funlearnapp
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Generate App Icons** (if changing the source image):
    ```bash
    dart run flutter_launcher_icons
    ```

4.  **Run the app**:
    ```bash
    flutter run
    ```

## 📂 Project Structure

- `lib/core/models/`: Data models for content.
- `lib/core/services/`: Content loading and notification logic.
- `lib/features/dashboard/`: The main gallery-style UI.
- `assets/data/`: Contains the `topic_of_the_day.json` content file.
- `assets/images/`: Storage for anatomy diagrams.

---

*Happy Learning!*
