// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ComposedSnapshotTesting",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "ComposedSnapshotTesting",
            targets: ["ComposedSnapshotTesting"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/jochenbernard/async-snapshot-testing",
            from: "0.1.0"
        )
    ],
    targets: [
        .target(
            name: "ComposedSnapshotTesting",
            dependencies: [
                .product(
                    name: "AsyncSnapshotTesting",
                    package: "async-snapshot-testing"
                )
            ]
        ),
        .testTarget(
            name: "ComposedSnapshotTestingTests",
            dependencies: ["ComposedSnapshotTesting"]
        )
    ]
)
