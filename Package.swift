// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "MtaProtoBuf",
    dependencies: [
        .Package(url: "https://github.com/alexeyxo/protobuf-swift.git", Version(3,0,13)),
        
    ]
)
