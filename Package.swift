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
                "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.44/Moonshine.xcframework.zip",
            checksum: "c1b314cd421087b7984f8fea4a7352b4869ada041e7b574b446c0897ca5e2aac"
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
