// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GLFW",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GLFW",
            targets: ["GLFW"]
        )
    ],
    targets: [
        .target(
            name: "GLFW",
            cSettings: [
                .define("_CRT_SECURE_NO_WARNINGS"),
                .define("APPLE", .when(platforms: [.macOS])),
                .define("GLFW_BUILD_COCOA", .when(platforms: [.macOS])),
                .define("WIN32", .when(platforms: [.windows])),
                .define("_GLFW_WIN32", .when(platforms: [.windows])),
                .define("_GLFW_BUILD_DLL", .when(platforms: [.windows]))       
            ],
            linkerSettings: [
                .linkedFramework("Cocoa", .when(platforms: [.macOS])),
                .linkedFramework("IOKit", .when(platforms: [.macOS])),
                .linkedFramework("CoreFoundation", .when(platforms: [.macOS])),
                .linkedLibrary("OpenGL32", .when(platforms: [.windows])),
                .linkedLibrary("Gdi32", .when(platforms: [.windows]))            
            ]
        )
    ],
    cLanguageStandard: .c99,
    cxxLanguageStandard: .cxx11
)
