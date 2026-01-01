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
                url: "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.10/Moonshine.framework.zip",
            checksum: "2d62d97c1f90d69a9472596ca19926219ca4f3ed32acbdbcee3243ab9c585bba"
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
