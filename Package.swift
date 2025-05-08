// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ComposedSnapshotTesting",
    products: [
        .library(
            name: "ComposedSnapshotTesting",
            targets: ["ComposedSnapshotTesting"]
        )
    ],
    targets: [
        .target(name: "ComposedSnapshotTesting"),
        .testTarget(
            name: "ComposedSnapshotTestingTests",
            dependencies: ["ComposedSnapshotTesting"]
        )
    ]
)
