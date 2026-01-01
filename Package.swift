// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Moonshine",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
    ],
    products: [
        .library(name: "Moonshine", targets: ["MoonshineVoice"])
    ],
    targets: [
        .binaryTarget(
            name: "moonshine",
            // path: "swift/Moonshine.xcframework",
            url:
                "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.14/Moonshine.xcframework.zip",
            checksum: "23219933f9c7d2ee2a9e6625a4c6633b4b9f7413e91bb926a92da59756632acb"
        ),
        .target(
            name: "MoonshineVoice",
            dependencies: ["moonshine"],
            path: "Sources/MoonshineVoice"
        ),
        .testTarget(
            name: "MoonshineVoiceTests",
            dependencies: ["MoonshineVoice"],
            path: "Tests/MoonshineVoiceTests"
        ),
    ]
)
