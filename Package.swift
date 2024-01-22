// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GLFW",
    products: [
        .library(
            name: "GLFW",
            targets: ["GLFW"]),
    ],
    targets: [
        .target(
            name: "GLFW"
        ),
        .testTarget(
            name: "GLFWTests",
            dependencies: ["GLFW"]),
    ]
)

#if os(Windows)

package
    .targets
    .first { $0.name == "GLFW" }?
    .exclude = [ 
        "cocoa_time.h",
        "cocoa_time.c",
        "posix_thread.h",
        "posix_module.c",
        "posix_thread.c",
        "posix_time.h",
        "posix_thread.h",
        "posix_module.c",
        "posix_time.c",
        "posix_thread.c"
     ]

#endif