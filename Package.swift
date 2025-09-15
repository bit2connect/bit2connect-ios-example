// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bit2ConnectExample",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Bit2ConnectExample",
            targets: ["Bit2ConnectExample"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../bit2connect-ios-sdk"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        .target(
            name: "Bit2ConnectExample",
            dependencies: [.product(name: "Bit2ConnectSDK", package: "bit2connect-ios-sdk")],
            path: "Bit2ConnectExample"
        ),
    ]
)
