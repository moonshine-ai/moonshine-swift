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
                "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.13/Moonshine.xcframework.zip",
            checksum: "920c3ccf7ace738c62e993988f76c76f264ce4c020b9b979cb1be586e9805c07"
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
