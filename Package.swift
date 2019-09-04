// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "XMPP",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
        .tvOS(.v12)
        // .watchOS(.v6)
    ],
    products: [
        .library(name: "XMPP", targets: ["XMPP"]),
        // Needed for Linux
        // .library(name: "PlistCoder", targets: ["XFoundationCompat"]),
        .executable(name: "XMPPDemo", targets: ["XMPPDemo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0"),
    ],
    targets: [
        .systemLibrary(name: "libxml2", pkgConfig: "libxml-2.0",
                       providers: [.brew(["libxml2"]),
                                   .apt(["libxml2-dev"])]),
        //.target(name: "XFoundationCompat"),
        // "XFoundationCompat",
        .target(name: "XMPP", dependencies: ["NIO", "libxml2", "NIOSSL"]),
        .target(name: "XMPPDemo", dependencies: ["XMPP"]),
        .testTarget(name: "XMPPTests", dependencies: ["XMPP"]),
    ]
)
