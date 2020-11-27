// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftDI",
	platforms: [ .iOS(.v13) ],
    products: [ .library( name: "SwiftDI", targets: ["SwiftDI"]) ],
    targets: [ .target(name: "SwiftDI",	path: "Sources") ]
)
