# Weather Prediction

Welcome to the Weather App! This Flutter application provides a 5-day weather forecast based on the user's current location. The app uses several Flutter plugins for state management, API interactions, and offline data persistence, delivering a smooth and reliable weather experience.

## Features

- **5-Day Weather Forecast**: Displays weather information for the next 5 days.
- **Current Location Detection**: Uses GPS to determine the user's current location.
- **List View Display**: Presents weather data in an organized list format.
- **Offline Persistence**: Retains the last fetched weather data for offline use.

## Plugins Used

### `dio`
- **Description**: A powerful HTTP client for Dart that supports interceptors, global configuration, FormData, request cancellation, and more.
- **Version**: ^5.0.0
- **Usage**: Manages API requests to fetch weather data.

### `bloc`
- **Description**: A Flutter library for state management using the BLoC (Business Logic Component) pattern.
- **Version**: ^8.0.0
- **Usage**: Handles app state and business logic.

### `built_value`
- **Description**: Provides built-in serialization and deserialization of complex data structures.
- **Version**: ^8.0.0
- **Usage**: Simplifies JSON serialization and deserialization.

### `hydrated_bloc`
- **Description**: Extends the BLoC pattern to support automatic state persistence and restoration.
- **Version**: ^8.0.0
- **Usage**: Automatically saves and restores the BLoC state across app restarts.

### `geolocator`
- **Description**: A plugin to access the device's location services and perform location-related tasks.
- **Version**: ^8.0.0
- **Usage**: Retrieves the user's current location.

## API

The app uses the [OpenWeatherMap API](https://openweathermap.org/api) to fetch weather data.

- **Endpoint**: `https://api.openweathermap.org/data/2.5/forecast`
- **Parameters**:
    - `lat` (Latitude of the location)
    - `lon` (Longitude of the location)
    - `appid` (API key)

