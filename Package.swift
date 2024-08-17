// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PianoUI",
    defaultLocalization: "en",
    platforms: [.visionOS(.v2), .iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "PianoUICore", targets: ["PianoUICore"]),
        .library(name: "PianoUI", targets: ["PianoUI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PianoUICore",
            swiftSettings: [
                .swiftLanguageMode(.v5)
            ]
        ),
        .target(
            name: "PianoUI",
            dependencies: [
                "PianoUICore",
            ],
            swiftSettings: [
                .swiftLanguageMode(.v5)
            ]
        ),
    ]
)
