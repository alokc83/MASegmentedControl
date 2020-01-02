import PackageDescription

let package = Package(name: "MASegmentedControl",
                      platforms: [.iOS(.v13)],
                      products: [.library(name: "MASegmentedControl",
                                          targets: ["MASegmentedControl"])],
                      targets: [.target(name: "MASegmentedControl",
                                        path: "MASegmentedControl")],
                      swiftLanguageVersions: [.v5])
