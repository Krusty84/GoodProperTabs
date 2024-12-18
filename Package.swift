// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "GoodProperTabs",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "GoodProperTabs",
            targets: ["GoodProperTabs"]
        )
    ],
    targets: [
        .target(
            name: "GoodProperTabs",
            dependencies: []
        ),
        .testTarget(
            name: "GoodProperTabsTests",
            dependencies: ["GoodProperTabs"]
        )
    ]
)
