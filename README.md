# DataUSAApp

DataUSAApp is an iOS application built using SwiftUI and the Data USA API. The app provides population data for various areas in the USA, including both nation-level and state-level data. The project showcases the use of modern iOS architecture principles, MVVM (Model-View-ViewModel) design pattern, and Combine for reactive programming. The app is also structured to include unit testing.

## Features

- **Nation-Level Data**: View population statistics for the entire United States across multiple years.
- **State-Level Data**: Access population data for individual states, with the most recent year's statistics.
- **Search Functionality**: Search through the population data by state name.
- **Reactive Programming**: Leverages Combine for asynchronous data fetching and state management.
- **Modern iOS Architecture**: Implements the MVVM design pattern for a clean and maintainable codebase.
- **Unit Testing**: Includes unit tests for ViewModels and Repository layers.

## Architecture

### MVVM (Model-View-ViewModel)

- **Model**: Represents the data structures used in the app, including `NationData` and `StateData` models, which map to the API's response.
- **ViewModel**: Handles the business logic and data manipulation, including fetching data from the API and preparing it for display in the View.
- **View**: Composed using SwiftUI, this layer handles the UI presentation, binding directly to the ViewModel's published properties.

### Repository Pattern

- **DataUSARepository**: Handles network calls to the Data USA API, fetching population data for both the nation and individual states.

### Combine

- Used for handling asynchronous data fetching and state management within the app, providing a reactive programming approach.

## API Integration

The app uses the [Data USA API](https://datausa.io/api) to fetch population data. Below are the two main endpoints used:

- **Nation Data**: Fetches population data for the entire nation.
  - URL: `https://datausa.io/api/data?drilldowns=Nation&measures=Population`
  
- **State Data**: Fetches the most recent population data for all states.
  - URL: `https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest`

## Unit Testing

Unit tests are provided to ensure the robustness of the app's ViewModels and Repository layers. The tests are written using the XCTest framework and include:

- **ViewModel Tests**: Ensures that the ViewModels correctly fetch and process data.
- **Repository Tests**: Mocks API responses to test the data fetching logic without hitting the actual API.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.0+

## License

DataUSAApp is licensed under the MIT License. See the `LICENSE` file for more details.

## Acknowledgements

- [Data USA API](https://datausa.io/api) for providing the data.
- The Swift and iOS development community for various tutorials and resources.
