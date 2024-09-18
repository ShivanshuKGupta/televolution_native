# televolution_native

A new televolution_native project.

## Running the project

Run your project using `jaspr serve`.

The development server will be available on `http://localhost:8080`.

## Building the project

Build your project using `jaspr build`.

The output will be located inside the `build/jaspr/` directory.

# Project structure
## This is the project structure


lib/
├── core/                  // Core functionalities shared across the app
│   ├── errors/            // Error handling (Failure classes)
│   ├── utils/             // Utility functions and classes (extensions, helpers)
│   ├── usecases/          // Generic UseCase classes, reusable use case logic
│   └── constants/         // App-wide constants (e.g., color, dimensions, etc.)
│
├── data/                  // Data layer, responsible for external data sources
│   ├── models/            // Data models and Data Transfer Objects (DTOs)
│   ├── repositories/      // Implementation of repositories (communicates with domain layer)
│   └── datasources/       // Data sources (APIs, local databases, cache, etc.)
│       ├── remote/        // Remote data source (e.g., APIs, HTTP clients)
│       └── local/         // Local data source (e.g., SQLite, SharedPrefs)
│
├── domain/                // Business logic layer (independent of UI and data sources)
│   ├── entities/          // Core business objects (pure classes with no dependencies)
│   ├── repositories/      // Abstract repository interfaces (contracts)
│   ├── usecases/          // Business logic operations (interactors)
│   └── value_objects/     // Value objects and other domain-specific abstractions
│
├── presentation/          // UI layer, handles user interaction and visual representation
│   ├── providers/         // Riverpod providers for state management
│   ├── screens/           // Screen UI components
│   │   ├── home/          // Home feature (e.g., HomeScreen)
│   │   │   ├── home_screen.dart
│   │   │   └── home_view_model.dart  // Riverpod provider for HomeScreen
│   │   ├── login/
│   │   │   ├── login_screen.dart
│   │   │   └── login_view_model.dart // Riverpod provider for LoginScreen
│   └── widgets/           // Reusable UI components (buttons, input fields, etc.)
│
├── app/                   // App configuration (starting point)
│   ├── routes.dart        // App routing configuration
│   └── app.dart           // App entry point and ProviderScope setup
│
├── main.dart              // Main app entry point
