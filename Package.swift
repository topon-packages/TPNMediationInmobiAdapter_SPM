// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "TPNMediationInmobiAdapter",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "TPNMediationInmobiAdapter",
            targets: ["TPNMediationInmobiAdapterTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/topon-packages/TPNiOS_SPM.git", from: "6.5.60"),
        .package(url: "https://github.com/InMobi/InMobiSDK-Swift-Package.git", exact: "11.5.0")
    ],
    targets: [
        .binaryTarget(
            name: "AnyThinkInmobiAdapter",
            url: "https://topon-sdk-release.oss-accelerate.aliyuncs.com/TPN_Release/iosnetwork_2/AnyThinkInmobiAdapter/110500.2.10/AnyThinkInmobiAdapter-110500.2.10.zip",
            checksum: "09a1f00e889b98dbe9721a9702f8b738a4ca211d03d3739d8b80e69490434645"
        ),
        .target(
            name: "TPNMediationInmobiAdapterTarget",
            dependencies: [
                "AnyThinkInmobiAdapter",
                .product(name: "TPNiOS", package: "TPNiOS_SPM"),
                .product(name: "InMobiSDK", package: "InMobiSDK-Swift-Package")
            ],
            path: "Sources/TPNMediationInmobiAdapterTarget"
        )
    ]
)