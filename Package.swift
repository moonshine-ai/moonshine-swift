// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Moonshine",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
    ],
    products: [
        .library(name: "Moonshine", type: .static, targets: ["MoonshineVoice"])
    ],
    targets: [
        .binaryTarget(
            name: "Moonshine",
            // Uncomment this to use the locally-built XCFramework
            // path: "Moonshine.xcframework",
            url:
                "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.40/Moonshine.xcframework.zip",
            checksum: "4e476b497a9d1cd583dd03e2e1bbeae75048945aae3b54374f6b27af4e01f74c"
        ),
        .target(
            name: "MoonshineVoice",
            dependencies: ["Moonshine"],
            path: "Sources/MoonshineVoice",
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        ),
        .testTarget(
            name: "MoonshineVoiceTests",
            dependencies: ["MoonshineVoice"],
            path: "Tests/MoonshineVoiceTests",
            resources: [
                .copy("test-assets")
            ]
        ),
    ]
)
