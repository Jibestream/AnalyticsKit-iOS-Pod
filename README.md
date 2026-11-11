# AnalyticsKit-iOS-Pod

[![CI Status](http://img.shields.io/travis/louieyune/AnalyticsKit-iOS-Pod.svg?style=flat)](https://travis-ci.org/louieyune/AnalyticsKit-iOS-Pod)
[![Version](https://img.shields.io/cocoapods/v/AnalyticsKit-iOS-Pod.svg?style=flat)](http://cocoapods.org/pods/AnalyticsKit-iOS-Pod)
[![License](https://img.shields.io/cocoapods/l/AnalyticsKit-iOS-Pod.svg?style=flat)](http://cocoapods.org/pods/AnalyticsKit-iOS-Pod)
[![Platform](https://img.shields.io/cocoapods/p/AnalyticsKit-iOS-Pod.svg?style=flat)](http://cocoapods.org/pods/AnalyticsKit-iOS-Pod)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- **iOS 15.0 or later**, as of 3.0.0. Release 2.1.0 and earlier declare a lower
  floor (the podspec carried conflicting iOS 9.0 and 10.0 declarations) and
  remain resolvable, so a project that cannot move to iOS 15 yet can stay
  pinned to 2.1.0.
- **Xcode 15 or later** for Swift Package Manager (`Package.swift` declares
  `swift-tools-version:5.9`). CocoaPods has no additional Xcode requirement
  beyond what the binary itself needs.
- **[JMapiOSSDK](https://github.com/Jibestream/JMap-iOS-SDK-Pod) 6.0.0 or later.**
  `JMapAnalyticsKit`'s public headers `#import <JMapCoreKit/JMapCoreKit.h>`, so
  the SDK is a compile-time requirement and not merely a link-time one. Both
  manifests declare it, so either package manager resolves it for you. Releases
  2.1.0 and earlier did not declare this dependency at all, and had to be paired
  with JMapiOSSDK by hand.
- **`-ObjC` in your target's Other Linker Flags.** `JMapAnalyticsKit` itself contains no
  Objective-C categories and needs no linker flags of its own, but the
  JMapiOSSDK frameworks underneath it do: without `-ObjC` their categories are
  not registered at runtime, producing an `unrecognized selector` crash during
  map parsing. The build succeeds either way, so the failure is silent until
  run time. CocoaPods writes this flag into its generated xcconfig
  automatically; with Swift Package Manager you must set it yourself.

## Installation

AnalyticsKit supports **both** Swift Package Manager and CocoaPods. Both are served
from this one repository and the same git tag: SPM reads `Package.swift`,
CocoaPods reads `AnalyticsKit-iOS-Pod.podspec`, and both point at the same
XCFramework under `AnalyticsKit-iOS-Pod/Frameworks/`. Each ignores the other's
manifest.

> **Pick one.** Adding AnalyticsKit through both CocoaPods and Swift Package Manager in
> the same project links the framework twice and fails with duplicate symbol
> errors. The same applies to `JMapiOSSDK` underneath it: both must come from
> the same package manager.

### Swift Package Manager (3.0.0 and later)

In Xcode, choose **File > Add Package Dependencies...**, enter
`https://github.com/Jibestream/AnalyticsKit-iOS-Pod.git`, pick **Up to Next Major Version**
from `3.0.0`, and add the `JMapAnalyticsKit` product to your app target.

Or, in a `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Jibestream/AnalyticsKit-iOS-Pod.git", from: "3.0.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [.product(name: "JMapAnalyticsKit", package: "AnalyticsKit-iOS-Pod")]
    )
]
```

The product provides the `JMapAnalyticsKit` module and brings in JMapiOSSDK
(`JMapCoreKit`, `JMapRenderingKit`, `JMapControllerKit`) transitively, so you do
not add that package separately.

Swift Package Manager support is available from **3.0.0** onward. Earlier tags do
not contain a `Package.swift` and cannot be resolved by SPM.

### CocoaPods (deprecated)

CocoaPods support continues for now but will be removed in a future release;
please move to Swift Package Manager.

To install, simply add the following line to your Podfile:

```ruby
pod 'AnalyticsKit-iOS-Pod', :git => 'https://github.com/Jibestream/AnalyticsKit-iOS-Pod.git'
```

For installing the first time run:
```ruby
pod install
```

To get the latest version of the pod run:
```ruby
pod update
```

## Author

Louie, lyuen@jibestream.com
