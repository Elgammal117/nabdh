# Nabdh

A comprehensive Flutter application designed to facilitate medical or nursing service requests, bookings, and live tracking. 

## 🚀 Features

Based on the project structure, **Nabdh** includes the following core features:
* **Authentication**: Secure login, registration, and OTP verification.
* **Service Requests & Bookings**: Browse available services, request a nurse/service, and manage upcoming or confirmed bookings.
* **Live Tracking**: Real-time location tracking for service providers using Google Maps.
* **Payments**: Integrated payment flows for secure service checkouts.
* **Messaging & Notifications**: In-app chat messaging and real-time push notifications.
* **User Accounts**: Manage profiles, settings, and view booking history.
* **Reviews**: Leave ratings and feedback for completed services.

## 🛠 Technologies & Packages

This project is built using the Flutter framework and utilizes several key packages to ensure a robust, scalable, and beautiful application:

* **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) for predictable state management.
* **Networking**: [dio](https://pub.dev/packages/dio) for handling HTTP requests.
* **Functional Programming**: [dartz](https://pub.dev/packages/dartz) for functional programming concepts like `Either` for error handling.
* **JSON Serialization**: [json_annotation](https://pub.dev/packages/json_annotation) & `json_serializable` for safe parsing of API responses.
* **Maps & Location**: [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) for live tracking and location displays.
* **Responsive UI**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) to ensure the UI scales perfectly across different screen sizes.
* **Assets**: [flutter_svg](https://pub.dev/packages/flutter_svg) for crisp vector graphics and `image_picker` for user uploads.
* **UI Enhancements**: [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator) for onboarding flows.
* **Custom Fonts**: Alexandria font family integrated natively.

## 📂 Project Structure

The project follows a clean architecture/feature-driven structure:
```text
lib/
├── Core/
│   └── Features/
│       ├── Auth/             # Login, Registration, OTP
│       ├── home/             # Main dashboard
│       ├── live_tracking/    # Google Maps tracking
│       ├── Message/          # Chat features
│       ├── MyAccount/        # Profile & Settings
│       ├── MyBooking/        # Booking history & management
│       ├── Notification/     # Push notifications
│       ├── NurseHome/        # Provider-side dashboard
│       ├── payment/          # Checkout and payment gateways
│       ├── request_service/  # Service selection and forms
│       └── review/           # Ratings and feedback
├── Navigation.dart           # App routing logic
├── Splash_Screen.dart        # Initial splash view
├── onboarding.dart           # Onboarding screens
└── dio_helper.dart           # API client configuration
```

## 🏁 Getting Started

To run this project locally, ensure you have Flutter installed.

### Prerequisites
* [Flutter SDK](https://flutter.dev/docs/get-started/install) (Version ^3.11.4 or higher recommended)
* Android Studio or Xcode (for iOS)

### Installation

1. **Clone the repository** (if you haven't already):
   ```bash
   git clone <repository-url>
   cd nabdh
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate Code** (required for `json_serializable` and `dartz` if using build_runner):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

## 📝 Usage

* Launch the app in a simulator or on a physical device.
* Complete the onboarding flow (powered by `smooth_page_indicator`).
* Register or log in to access the home dashboard.
* From there, you can explore services, make a booking, chat with providers, and track active requests on the map.
