// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LastKit",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "LastKit",
            targets: ["LastKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LastKit",
            dependencies: []
        ),
        .testTarget(
            name: "LastKitTests",
            dependencies: ["LastKit"]
        ),
    ]
)
