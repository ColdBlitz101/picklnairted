# 🥒 Pickl

Pickl is a Flutter-based mobile app that helps groups make decisions together — whether it's picking a place to eat, a movie to watch, or anything else! Users can create or join group "jars", swipe through options Tinder-style, and get a collective decision based on everyone’s preferences.

---

## 🚀 Features

- 📱 **Modern iOS-Only UI** with animated transitions and custom fonts  
- 🔐 **Firebase Auth** for secure sign-in and sign-up using email/password  
- 🫙 **Create or Join Groups** via a simple interface  
- 🫳 **Swipe Interface** for voting on options with real-time feedback  
- ✅ **Final Decision Screen** shows accepted and rejected options  
- 🖼️ **Animated Welcome Screen** with floating Pickle mascot  
- 🌈 Clean UI with consistent theming and gradients

---

## 🛠️ Tech Stack

| Layer         | Technology                             |
|---------------|-----------------------------------------|
| Framework     | Flutter (Dart)                          |
| Platform      | iOS                                     |
| Auth          | Firebase Authentication (Email/Password)|
| UI Libraries  | `google_fonts`, `swipe_cards`           |
| State Mgmt    | Basic `setState` (can upgrade later)    |
| Backend (TBD) | Planned Firebase Firestore integration  |

---

## 🔧 Getting Started

### Prerequisites

- Flutter 3.x (latest stable)
- Firebase project setup (iOS bundle ID registered)
- Xcode (for iOS development)

### Installation

```bash
git clone https://github.com/your-username/pickl.git
cd pickl
flutter pub get
```

### Firebase Setup (iOS)

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Add a new project and register an iOS app with your correct bundle ID
3. Download `GoogleService-Info.plist` and place it in `ios/Runner`
4. In Firebase console, enable **Email/Password** authentication

### Run the App

```bash
flutter run
```

---

## 📂 Directory Structure

```
lib/
├── main.dart
├── screens/
│   ├── welcome_screen.dart
│   ├── login_screen.dart
│   ├── group_screen.dart
│   ├── create_group_screen.dart
│   ├── join_group_screen.dart
│   ├── group_lobby_screen.dart
│   ├── swipe_screen.dart
│   └── decision_screen.dart
assets/
└── images/
    └── pickle.png
```

---

## 📜 License

```
MIT License

Copyright (c) 2025 Pranav Nair and Pranav Goteti

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🤝 Contributors

- **Pranav Goteti**
- **Pranav Nair**

---

## ✨ Future Plans

- ✅ Firestore group syncing
- 🗳️ Real-time voting updates
- 🔔 Push notifications for group activity
- 📊 Analytics for swipe trends

---

Made with ❤️ using Flutter.
