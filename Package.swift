// swift-tools-version:5.1
import PackageDescription

let package = Package(name: "MASegmentedControl",
                      platforms: [.iOS(.v10)],
                      products: [.library(name: "MASegmentedControl",
                                          targets: ["MASegmentedControl"])],
                      targets: [.target(name: "MASegmentedControl",
                                        path: "MASegmentedControl/Class")],
                      swiftLanguageVersions: [.v4, .v4_2, .v5])
