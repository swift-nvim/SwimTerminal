// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SwimTerminal",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwimTerminal",
            targets: ["SwimTerminal"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-nvim/Swim.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-nvim/SwimInterpreter.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-lco/Terminal.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-lco/Clipboard.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-lco/Surface.git",
            branch: "master"
        ),
    ],
    targets: [
        .target(
            name: "SwimTerminal",
            dependencies: [
                "Swim",
                "SwimInterpreter",
                "Terminal",
                "Clipboard",
                .product(
                    name: "Surface",
                    package: "Surface"
                ),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
