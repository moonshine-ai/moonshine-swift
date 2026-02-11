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
                "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.48/Moonshine.xcframework.zip",
            checksum: "309e8185f3f99902c62b2ea2afd4732fbea7083797eecede490d2b1c1d1f0808"
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
