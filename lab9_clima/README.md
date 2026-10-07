# Clima 

A weather forecast application providing real-time conditions using the OpenWeatherMap API.

## Features
- City-based weather search and automatic display updates
- Metric measurements: temperature, feels-like, humidity, wind speed, and daily bounds
- Dynamic condition icons and contextual advice based on current weather
- Graceful offline and error fallbacks

## Technical Details
- Asynchronous programming with Dart `async`/`await`
- RESTful API consumption using the `http` package
- JSON serialization via `WeatherData.fromJson` model factory
- Form input management using `TextEditingController`
