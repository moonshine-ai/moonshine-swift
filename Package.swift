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
                "https://github.com/moonshine-ai/moonshine-swift/releases/download/v0.0.12/Moonshine.xcframework.zip",
            checksum: "0b297b1032741ccf92adddce94daf481d79ab14a96b348a3959d0e91d8bdc7a4"
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
