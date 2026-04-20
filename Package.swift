// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Moonshine",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
    ],
    products: [
        .library(name: "MoonshineVoice", type: .static, targets: ["MoonshineVoice"])
    ],
    targets: [
        .binaryTarget(
            name: "Moonshine",
            // Uncomment this to use the locally-built XCFramework
            // path: "Moonshine.xcframework",
            url:
                "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.59/Moonshine.xcframework.zip",
            checksum: "d88aa35b31b867c8b4b1f963ae3f8cbeac018886ca20fdb97eeeacc18f6e36d4"
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
