# omdb_movies

## Motivation

I developed this app to demonstrate the latest APIs from popular Flutter packages including Riverpod and GoRouter. While not intended as a comprehensive movies application, it showcases common use cases and essential features that developers frequently encounter in real-world projects.

## Current Features

* Infinite scrolling with pagination
* Search functionality
* Loading UI with the Shimmer package
* Light/Dark mode

## Planned Features

* Golden tests
* Widget tests
* Integration tests

## Packages

* dio - HTTP client for API requests and networking
* flutter_riverpod - State management solution for Flutter apps
* riverpod_annotation - Code generation annotations for Riverpod providers
* envied - Environment variable management and configuration loader
* shimmer - Loading animations with shimmering placeholder effects
* cached_network_image - Network images with caching and placeholder support
* go_router - Declarative routing and navigation for Flutter
* freezed - Code generation for immutable classes and unions
* json_annotation - Annotations for JSON serialization code generation

## App Architecture & Folder structure

This project implements a robust Flutter architecture using Riverpod for state management, organized with a feature-first project structure that promotes modularity and maintainability. The codebase leverages the modern Riverpod Generator package for automatic provider generation, reducing boilerplate code. Each feature is self-contained with its own models, providers, and UI components, making the project highly scalable and maintainable.

## Getting a OMDB API Key and Running the Project

Getting Your OMDB API Key

1. Visit the OMDB API website
2. Fill out the registration form with the required information
3. Submit the form and check your email for the API key
4. Important: Click the activation link in the email to enable your API key

Once you have this, create an .env file at the root of the project and add your key:

```export OMDB_API_KEY=your_api_key_here```

Then, run the code generator:

```dart run build_runner build -d```

Note: In this project im using flutter version 3.32.2



