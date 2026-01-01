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
                "https://github.com/moonshine-ai/moonshine-v2/releases/download/v0.0.8/Moonshine.xcframework.zip",
            checksum: "1d38b3d10175d75e322cfe9a1eb6e459177daf351255fb2e38a9c30c18941f80"
        ),
        .target(
            name: "MoonshineVoice",
            dependencies: ["moonshine"],
            path: "swift/Sources/MoonshineVoice"
        ),
        .testTarget(
            name: "MoonshineVoiceTests",
            dependencies: ["MoonshineVoice"],
            path: "swift/Tests/MoonshineVoiceTests"
        ),
    ]
)
