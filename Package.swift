// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Termy",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.2"),
        .package(url: "https://github.com/dylanshine/openai-kit.git", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "Termy",
            dependencies: ["Core"]
        ),
        .target(
            name: "Core",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "OpenAIKit", package: "openai-kit")
            ]
        ),
        .testTarget(
            name: "TermyTests",
            dependencies: ["Termy"]
        )
    ]
)
