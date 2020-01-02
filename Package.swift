// swift-tools-version:3.1.0
import PackageDescription

let package = Package(name: "MASegmentedControl",
                      platforms: [.iOS(.v10)],
                      products: [.library(name: "MASegmentedControl",
                                          targets: ["MASegmentedControl"])],
                      targets: [.target(name: "MASegmentedControl",
                                        path: "MASegmentedControl")],
                      swiftLanguageVersions: [.v4, .v4_2, .v5]),
		swift-tools-version:5.1
