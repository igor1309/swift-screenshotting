//
//  Screenshot.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

#warning("finish with description")
/// With trailing closure
///
///     let locales: [Locale] = ...
///     let devices: [Device] = ...
///
///     try screenshots(with: locales, on: devices) { device in
///         marketingMaterial(on: device)
///     }
///
/// - Parameters:
///   - screenshotDirectory: Optional directory to save screenshots. By default screenshots will be saved in a directory with the same name as the test file, and that directory will sit inside a directory `AppStoreScreenshots` next to your test file.
///   - file: The file in which failure occurred. Defaults to the file name of the test case in which this function was called.
///   - testName: The name of the test in which failure occurred. Defaults to the function name of the test case in which this function was called.
///   - line: The line number on which failure occurred. Defaults to the line number on which this function was called.
public func screenshots<V: View>(
    with locales: [Locale],
    on devices: [Device],
    view: @escaping (Device) -> V,
    screenshotDirectory: String? = nil,
    screenshotDirectoryName: String = "AppStoreScreenshots",
    file: StaticString = #file,
    testName: String = #function,
    line:  UInt = #line
) throws {
    for locale in locales {
        for device in devices {
            try screenshot(
                view(device),
                with: locale,
                on: device,
                screenshotDirectory: screenshotDirectory,
                screenshotDirectoryName: screenshotDirectoryName,
                file: file,
                testName: testName,
                line: line
            )
        }
    }
}

#warning("finish with description")
/// With non-trailing closure
///
///     let locales: [Locale] = ...
///     let devices: [Device] = ...
///
///     try screenshots(appStorePreview(on:), with: locales, on: devices)
///
/// - Parameters:
///   - screenshotDirectory: Optional directory to save screenshots. By default screenshots will be saved in a directory with the same name as the test file, and that directory will sit inside a directory `AppStoreScreenshots` next to your test file.
///   - file: The file in which failure occurred. Defaults to the file name of the test case in which this function was called.
///   - testName: The name of the test in which failure occurred. Defaults to the function name of the test case in which this function was called.
///   - line: The line number on which failure occurred. Defaults to the line number on which this function was called.
public func screenshots<V: View>(
    _ view: @escaping (Device) -> V,
    with locales: [Locale],
    on devices: [Device],
    screenshotDirectory: String? = nil,
    screenshotDirectoryName: String = "AppStoreScreenshots",
    file: StaticString = #file,
    testName: String = #function,
    line:  UInt = #line
) throws {
    try screenshots(
        with: locales,
        on: devices,
        view: view,
        screenshotDirectory: screenshotDirectory,
        screenshotDirectoryName: screenshotDirectoryName,
        file: file,
        testName: testName,
        line: line
    )
}

#warning("finish with description")
/// - Parameters:
///   - screenshotDirectory: Optional directory to save screenshots. By default screenshots will be saved in a directory with the same name as the test file, and that directory will sit inside a directory `AppStoreScreenshots` next to your test file.
///   - file: The file in which failure occurred. Defaults to the file name of the test case in which this function was called.
///   - testName: The name of the test in which failure occurred. Defaults to the function name of the test case in which this function was called.
///   - line: The line number on which failure occurred. Defaults to the line number on which this function was called.
@discardableResult
public func screenshot<V: View>(
    _ view: @autoclosure () throws -> V,
    with locale: Locale,
    on device: Device,
    screenshotDirectory: String? = nil,
    screenshotDirectoryName: String = "AppStoreScreenshots",
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line
) throws -> URL {
    let (screenshotDirectoryURL, screenshotFileURL) = makeFileAndDirectoryURLs(
        locale: locale,
        device: device,
        directory: screenshotDirectory,
        directoryName: screenshotDirectoryName,
        file: file,
        testName: testName
    )
    
    let fileManager = FileManager.default
    try fileManager.createDirectory(
        at: screenshotDirectoryURL,
        withIntermediateDirectories: true
    )
    
    let data = try view()
        .environment(\.locale, locale)
        .snapshot(scale: device.scale)
    
    try data.write(to: screenshotFileURL)
    
    return screenshotFileURL
}

func makeFileAndDirectoryURLs(
    locale: Locale,
    device: Device,
    directory: String?,
    directoryName: String,
    file: StaticString,
    testName: String
) -> (directoryURL: URL, fileURL: URL) {
    let directoryName = directoryName.isEmpty ? "___" : directoryName
    
    let directoryURL = directory
        .map { URL(fileURLWithPath: $0, isDirectory: true) }
    ?? URL(fileURLWithPath: "\(file)", isDirectory: false)
        .deletingLastPathComponent()
        .appendingPathComponent(directoryName)
        .appendingPathComponent(locale.identifier)
    
    let testName = testName.replacingOccurrences(
        of: #"^test_?"#,
        with: "",
        options: .regularExpression
    )
    
    let fileName = "\(locale.identifier)-\(device.name)-\(testName)"
        .sanitize()
    let fileURL = directoryURL
        .appendingPathComponent(fileName)
        .appendingPathExtension("png")

    return (directoryURL, fileURL)
}

extension View {
    func snapshot(scale: CGFloat) -> Data {
        let root = self
            .edgesIgnoringSafeArea(.top)
        let controller = UIHostingController(rootView: root)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        format.opaque = true
        format.preferredRange = .extended
        
        let bounds = controller.view.bounds
        let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
        var hasRendered = false
        
        let data = renderer.pngData { _ in
            hasRendered = view?.drawHierarchy(in: bounds, afterScreenUpdates: true) ?? false
        }
        
        guard hasRendered else {
            throw DrawHierarchyError()
        }
        
        return data
    }
}

struct DrawHierarchyError: Error {}

extension String {
    func sanitize() -> String {
        return self
            .replacingOccurrences(of: "\\W+", with: "-", options: .regularExpression)
            .replacingOccurrences(of: "^-|-$", with: "", options: .regularExpression)
    }
}
