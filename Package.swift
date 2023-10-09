// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ComposerKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ComposerKit",
            targets: ["ComposerKit"]),
    ],
    targets: [
        .target(
            name: "ComposerKit"),
        .testTarget(
            name: "ComposerKitTests",
            dependencies: ["ComposerKit"]),
    ]
)
