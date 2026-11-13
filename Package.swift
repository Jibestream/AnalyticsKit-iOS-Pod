// swift-tools-version:5.9
// Swift Package Manager distribution of the Jibestream AnalyticsKit, starting at 3.0.0.
// The same git tag also serves the CocoaPods podspec (AnalyticsKit-iOS-Pod.podspec) until
// CocoaPods is retired.
//
// Release: tag the commit with the bare semantic version (e.g. `3.0.0`, no `v` prefix) and keep
// `s.version` in AnalyticsKit-iOS-Pod.podspec in step with it.
import PackageDescription

let package = Package(
    name: "AnalyticsKit-iOS-Pod",
    platforms: [
        // Must be at least the JMapiOSSDK package's own floor, or SPM refuses to resolve the
        // graph. The shipped binary declares an iOS 10 floor and stays forward-compatible, so
        // this is a policy floor rather than a technical one.
        .iOS(.v15)
    ],
    products: [
        // AnalyticsKitSPMSupport ships in the same product as the binary target on purpose: see
        // its comment below. A consumer adds this one product and gets both.
        .library(
            name: "JMapAnalyticsKit",
            targets: ["JMapAnalyticsKit", "AnalyticsKitSPMSupport"]
        )
    ],
    dependencies: [
        // A range, not `exact:`. An exact pin here makes the dependency graph
        // unsatisfiable for any consumer that declares its own JMapiOSSDK requirement.
        .package(url: "https://github.com/Jibestream/JMap-iOS-SDK-Pod.git", from: "6.0.0")
    ],
    targets: [
        // Static Objective-C framework containing no Objective-C categories of its own, so it
        // adds no -ObjC requirement beyond the one JMapiOSSDK already imposes.
        //
        // Unlike the JMapiOSSDK frameworks, this archive carries its own LC_LINKER_OPTION
        // entries, so it auto-links the system frameworks it needs. Its public headers import
        // UIKit and Foundation on top of that, which the consumer's Clang module graph links
        // independently. Hence no linkerSettings here.
        .binaryTarget(
            name: "JMapAnalyticsKit",
            path: "AnalyticsKit-iOS-Pod/Frameworks/JMapAnalyticsKit.xcframework"
        ),
        // Exists only to carry the JMapiOSSDK dependency edge, which `.binaryTarget` cannot
        // declare. JMapAnalyticsKit's public headers `#import <JMapCoreKit/JMapCoreKit.h>`, so
        // without this edge `import JMapAnalyticsKit` fails to compile with
        // "'JMapCoreKit/JMapCoreKit.h' file not found".
        .target(
            name: "AnalyticsKitSPMSupport",
            dependencies: [.product(name: "JMapiOSSDK", package: "JMap-iOS-SDK-Pod")]
        )
    ]
)
