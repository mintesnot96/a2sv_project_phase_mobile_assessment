# A2SV Project Phase Assessment - Mobile Team

## Weather App

Welcome to the A2SV Project Phase Assessment for the Mobile Team. In this repository, you will find the source code and details of the "Weather App" project that was created as part of the assessment. This app retrieves and displays weather information for different cities.

## Table of Contents

- [Project Overview](#project-overview)
- [Code Structure and Architecture](#code-structure-and-architecture)
- [User Interface](#user-interface)
- [Data Handling](#data-handling)
- [Documentation](#documentation)
- [Testing](#testing)
- [Assessment Criteria](#assessment-criteria)

## Project Overview

As part of the assessment, the following tasks were completed:

- Built a weather application using Flutter, Dart, Clean Architecture, and the Bloc state management pattern.
- Implemented UI screens based on the provided Figma design, including the home screen, city detail screen, and search screen.
- Integrated with a weather API to retrieve weather data for different cities.
- Displayed the city's current temperature, weather condition, wind speed, and humidity.
- Implemented the search functionality to allow users to search for cities and display matching results.

Optionally, a "Favorites" feature was implemented to allow users to mark cities as favorites and store them using local storage.

## Code Structure and Architecture

The project follows the principles of Clean Architecture, separating the app into different layers: Presentation, Domain, and Data. The Bloc state management pattern is used to handle the application's state effectively. The code adheres to best practices for maintainable and clean code.

## User Interface

The user interface of the "Weather App" closely resembles the provided Figma design. Attention was given to layout design, responsiveness, and user experience.

## Data Handling

- Weather data is retrieved from the API using HTTP requests.
- The received JSON data is parsed and displayed in the app.
- Local data storage is implemented using the `shared_preferences` package to enable offline usage and provide a seamless experience for users.

## Documentation

The app uses a weather API with the following base URL:

base_url = https://api.worldweatheronline.com/premium/v1/weather.ashx?key={API_KEY}&q={City_Name}&num_of_days=7&tp=3&format=json

API Keys provided for testing are: "68da0c21ae6d455e91771733231110" and "42fae4b4a2b54ab09a672402231110".

## Testing

Unit tests were written for critical parts of the application, including domain functions and data handling, to ensure its reliability and correctness.

## Assessment Criteria

The app has been evaluated based on the following criteria:

- Functionality: The app meets the specified requirements and functions correctly.
- Code Quality and Readability: The code is well-organized, properly structured, and easy to understand.
- Architecture and Design Patterns: Clean Architecture and the Bloc pattern have been effectively applied.
- Best Practices and Standards: Flutter and Dart best practices and coding standards were followed.
- Git Usage: Best Git standards were used in version control.
- Testing: Unit tests for critical parts of the application were written.
- Additional Features/Creativity: Any extra features or creative solutions were considered.

---
<img width="956" alt="Screenshot 2023-10-13 000657" src="https://github.com/mintesnot96/a2sv_project_phase_mobile_assessment/assets/96992238/8b0acfd1-5797-4fa8-b7cb-83cdd4af21f9">

Feel free to explore the source code and enjoy the "Weather App." If you have any questions or need further information, please don't hesitate to reach out.

Thank you for reviewing this project, and i am waiting  your feedback!
