# Bit2Connect iOS Example

This is an example iOS application demonstrating how to integrate and use the Bit2Connect iOS SDK.

## Features Demonstrated

- SDK initialization
- Dynamic link creation
- Deferred deep link handling
- Direct deep link handling
- Custom data storage and retrieval
- Storage management

## Setup

**Note**: This example project requires Xcode to build properly due to UIKit dependencies.

Please see [SETUP.md](SETUP.md) for detailed setup instructions.

Quick setup:
1. Create a new iOS project in Xcode
2. Add the Bit2Connect SDK as a dependency
3. Copy the example files from this project
4. Update the API key in `AppDelegate.swift`:
   ```swift
   Bit2ConnectSDK.shared.initialize(
       baseURL: "https://api.bit2connect.com",
       apiKey: "your-api-key-here", // Replace with your actual API key
       debugMode: true
   )
   ```

## Usage

The example app provides a simple interface to test various SDK features:

- **Create Dynamic Link**: Creates a dynamic link with sample data
- **Test Storage**: Tests storing and retrieving custom data
- **Clear All Data**: Clears all stored custom data

## Deep Link Handling

The app demonstrates both deferred and direct deep link handling:

- **Deferred Deep Links**: Handled automatically on app launch
- **Direct Deep Links**: Handled when the app is opened via a deep link

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## License

This example project is licensed under the MIT License.
