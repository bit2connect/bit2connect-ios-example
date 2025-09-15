# Setup Instructions for Bit2Connect iOS Example

This example project demonstrates how to integrate and use the Bit2Connect iOS SDK.

## Prerequisites

- Xcode 12.0 or later
- iOS 13.0 or later
- Swift 5.0 or later

## Setup Instructions

### Option 1: Using Xcode (Recommended)

1. Open Xcode
2. Create a new iOS project:
   - Choose "App" template
   - Set Product Name to "Bit2ConnectExample"
   - Set Bundle Identifier to "com.bit2connect.example"
   - Set Language to "Swift"
   - Set Interface to "Storyboard" or "SwiftUI"
   - Set minimum deployment to iOS 13.0

3. Add the Bit2Connect SDK as a dependency:
   - In Xcode, go to File > Add Package Dependencies
   - Enter the URL: `https://github.com/bit2connect/bit2connect-ios-sdk.git`
   - Or if using local development: `file:///path/to/bit2connect-ios-sdk`

4. Copy the example files:
   - Copy `AppDelegate.swift` from this project
   - Copy `SceneDelegate.swift` from this project
   - Copy `ViewController.swift` from this project
   - Copy `Info.plist` configuration from this project

5. Update the API key in `AppDelegate.swift`:
   ```swift
   Bit2ConnectSDK.shared.initialize(
       baseURL: "https://api.bit2connect.com",
       apiKey: "your-api-key-here", // Replace with your actual API key
       debugMode: true
   )
   ```

### Option 2: Using CocoaPods

1. Create a new iOS project in Xcode
2. Add a `Podfile` to your project root:
   ```ruby
   platform :ios, '13.0'
   
   target 'Bit2ConnectExample' do
     use_frameworks!
     pod 'Bit2ConnectSDK', :path => '../bit2connect-ios-sdk'
   end
   ```

3. Run `pod install`
4. Open the generated `.xcworkspace` file
5. Copy the example files as described above

## Features Demonstrated

- SDK initialization
- Dynamic link creation
- Deferred deep link handling
- Direct deep link handling
- Custom data storage and retrieval
- Storage management

## Deep Link Configuration

Make sure to configure URL schemes in your `Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>com.example.bit2connect</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>bit2connect</string>
        </array>
    </dict>
</array>
```

## Usage

The example app provides a simple interface to test various SDK features:

- **Create Dynamic Link**: Creates a dynamic link with sample data
- **Test Storage**: Tests storing and retrieving custom data
- **Clear All Data**: Clears all stored custom data

## Troubleshooting

If you encounter build issues:

1. Make sure you're targeting iOS 13.0 or later
2. Ensure the SDK is properly added as a dependency
3. Check that all required frameworks are linked
4. Verify the API key is correctly set

## Support

For issues or questions, please refer to the main SDK documentation or contact support.
