# Setup Instructions for Bit2Connect iOS Example

This example project demonstrates how to integrate and use the Bit2Connect iOS SDK.

## Prerequisites

- Xcode 12.0 or later
- iOS 13.0 or later
- Swift 5.0 or later
- CocoaPods (for CocoaPods setup) or Xcode with SPM support (for SPM setup)

## Setup Instructions

### Option 1: Using CocoaPods (Recommended)

CocoaPods is the recommended way to integrate the Bit2Connect SDK as it provides better dependency management and easier updates.

#### 1.1: Using the Example Project

1. Clone this example project:
   ```bash
   git clone https://github.com/bit2connect/bit2connect-ios-example.git
   cd bit2connect-ios-example
   ```

2. Install CocoaPods if you haven't already:
   ```bash
   sudo gem install cocoapods
   ```

3. Install dependencies:
   ```bash
   pod install
   ```

4. Open the workspace (not the .xcodeproj file):
   ```bash
   open Bit2ConnectExample.xcworkspace
   ```

5. Update the API key in `AppDelegate.swift`:
   ```swift
   Bit2ConnectSDK.shared.initialize(
       baseURL: "https://api.bit2connect.com",
       apiKey: "your-api-key-here", // Replace with your actual API key
       debugMode: true
   )
   ```

#### 1.2: Adding to Your Own Project

1. Create a new iOS project in Xcode or use an existing one
2. Add a `Podfile` to your project root:
   ```ruby
   platform :ios, '13.0'
   
   target 'YourAppName' do
     use_frameworks!
     
     # Bit2Connect SDK
     pod 'Bit2ConnectSDK', '~> 1.0.1'
   end
   ```

3. Run `pod install` in your project directory
4. Open the generated `.xcworkspace` file (not the .xcodeproj file)
5. Import and initialize the SDK in your app

### Option 2: Using Swift Package Manager (SPM)

Swift Package Manager is Apple's native dependency manager and is integrated into Xcode.

#### 2.1: Using the Example Project

1. Clone this example project:
   ```bash
   git clone https://github.com/bit2connect/bit2connect-ios-example.git
   cd bit2connect-ios-example
   ```

2. Open the project in Xcode:
   ```bash
   open Bit2ConnectExample.xcodeproj
   ```

3. The Package.swift file is already configured. Xcode should automatically resolve dependencies.

4. Update the API key in `AppDelegate.swift` as shown above.

#### 2.2: Adding to Your Own Project

1. Open your project in Xcode
2. Go to File > Add Package Dependencies
3. Enter the repository URL: `https://github.com/bit2connect/bit2connect-ios-sdk.git`
4. Select the version (recommended: "Up to Next Major Version" with "1.0.1")
5. Add the package to your target
6. Import and initialize the SDK in your app

### Option 3: Local Development Setup

If you're developing the SDK locally:

#### With CocoaPods:
```ruby
platform :ios, '13.0'

target 'YourAppName' do
  use_frameworks!
  
  # Local development
  pod 'Bit2ConnectSDK', :path => '../bit2connect-ios-sdk'
end
```

#### With SPM:
Update your Package.swift:
```swift
dependencies: [
    .package(path: "../bit2connect-ios-sdk"),
],
```

## SDK Integration

### Import the SDK

In your Swift files where you want to use the SDK:

```swift
import Bit2ConnectSDK
```

### Initialize the SDK

Add the initialization code to your `AppDelegate.swift`:

```swift
import Bit2ConnectSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize Bit2Connect SDK
        Bit2ConnectSDK.shared.initialize(
            baseURL: "https://api.bit2connect.com",
            apiKey: "your-api-key-here", // Replace with your actual API key
            debugMode: true // Set to false for production
        )
        
        return true
    }
}
```

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

### Common Issues

1. **Build Errors**: Make sure you're targeting iOS 13.0 or later
2. **Import Errors**: Ensure the SDK is properly added as a dependency
3. **Framework Not Found**: Check that all required frameworks are linked
4. **API Key Issues**: Verify the API key is correctly set
5. **CocoaPods Issues**: 
   - Make sure you're opening the `.xcworkspace` file, not the `.xcodeproj` file
   - Run `pod deintegrate` and `pod install` if you encounter issues
   - Clear derived data: Product > Clean Build Folder

### CocoaPods Specific Issues

- If you get "No such module" errors, make sure you're using the workspace file
- If dependencies aren't updating, try `pod repo update` followed by `pod install`
- For version conflicts, check your Podfile.lock

### SPM Specific Issues

- If packages aren't resolving, try File > Packages > Reset Package Caches
- For build issues, try Product > Clean Build Folder
- Make sure your deployment target is iOS 13.0 or later

## Migration Guide

### From SPM to CocoaPods

1. Remove the package dependency from Xcode
2. Add a Podfile to your project root
3. Run `pod install`
4. Open the generated workspace file

### From CocoaPods to SPM

1. Remove the Podfile and run `pod deintegrate`
2. Add the package dependency in Xcode
3. Open the .xcodeproj file instead of the workspace

## Support

For issues or questions, please refer to the main SDK documentation or contact support.
