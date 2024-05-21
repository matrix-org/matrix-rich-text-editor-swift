// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let checksum = "9bef72adb0fcc9bccf42fe2dfec8e280a1812e67690d665fb97141ee373ed9ab"
let version = "2.37.3"
let url = "https://github.com/matrix-org/matrix-rich-text-editor-swift/releases/download/\(version)/WysiwygComposerFFI.xcframework.zip"
let package = Package(
    name: "WysiwygComposer",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "WysiwygComposer",
            targets: ["WysiwygComposer"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Cocoanetics/DTCoreText",
            exact: "1.6.26"
        )
    ],
    targets: [
        .target(
            name: "DTCoreTextExtended",
            dependencies: [
                .product(name: "DTCoreText", package: "DTCoreText"),
            ]
        ),
        .target(
            name: "HTMLParser",
            dependencies: [
                .product(name: "DTCoreText", package: "DTCoreText"),
                .target(name: "DTCoreTextExtended"),
            ]
        ),
        .binaryTarget(
            name: "WysiwygComposerFFI",
            url: url,
            checksum: checksum
        ),
        .target(
            name: "WysiwygComposer",
            dependencies: [
                .target(name: "WysiwygComposerFFI"),
                .target(name: "HTMLParser"),
            ]
        )
    ]
)
