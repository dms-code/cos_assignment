# CarOnSale Assignment

Flutter application for CarOnSale assignment.

## Implemented Features:

- User enters unique identification data
- Identification data is saved locally
- Identification screen is automatically skipped on future app runs
- VIN input from the user
- Request made using CosChallenge.httpClient
- Handled network errors
- Handled deserialization (JSON) errors
- Handled server errors (unexpected status codes)
- Clear error messages displayed to the user
- Suggestions shown on how to fix the errors
- VIN input is validated (e.g. length, allowed characters)
- Handled response with status code 300
- Displayed multiple vehicle options to the user
- Displayed the similarity score for each vehicle option
- Successfully received data is cached locally
- Automatic navigation after saving data
- Previously fetched data is shown if a later request fails (offline cache/fallback)
- Displayed auction data: price, model, and UUID
- Displayed feedback (positive or negative) from the API
- Clean and organized code
- Clear separation of concerns (architecture)
- Functional UI with good user experience (UX)
- Used only essential dependencies

## Getting Started

To run the application, follow these steps:

1. Clone the repository:
```bash
https://github.com/mobisec/caronsale_assignment.git
```

2. Navigate to the project directory:
```bash
cd cos_assignment
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the application:
```bash
flutter run
```
5. Run Tests:
```bash
flutter test
```

