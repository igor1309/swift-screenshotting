//
//  Screenshot.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

#warning("finish with description")
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
/// - Parameters:
///   - screenshotDirectory: Optional directory to save screenshots. By default screenshots will be saved in a directory with the same name as the test file, and that directory will sit inside a directory `AppStoreScreenshots` next to your test file.
///   - file: The file in which failure occurred. Defaults to the file name of the test case in which this function was called.
///   - testName: The name of the test in which failure occurred. Defaults to the function name of the test case in which this function was called.
///   - line: The line number on which failure occurred. Defaults to the line number on which this function was called.
public func screenshot<V: View>(
    _ view: @autoclosure () throws -> V,
    with locale: Locale,
    on device: Device,
    screenshotDirectory: String? = nil,
    screenshotDirectoryName: String = "AppStoreScreenshots",
    file: StaticString = #file,
    testName: String = #function,
    line:  UInt = #line
) throws {
    let screenshotDirectoryURL = screenshotDirectory
        .map { URL(fileURLWithPath: $0, isDirectory: true) }
    ?? URL(fileURLWithPath: "\(file)", isDirectory: false)
        .deletingLastPathComponent()
        .appendingPathComponent(screenshotDirectoryName)
        .appendingPathComponent(locale.identifier)
    
    let testName = testName.replacingOccurrences(
        of: #"^test_?"#,
        with: "",
        options: .regularExpression
    )
    
    let fileName = "\(locale.identifier)-\(device.name)-\(testName)"
        .sanitize()
    let screenshotFileURL = screenshotDirectoryURL
        .appendingPathComponent(fileName)
        .appendingPathExtension("png")
    
    let fileManager = FileManager.default
    try fileManager.createDirectory(
        at: screenshotDirectoryURL,
        withIntermediateDirectories: true
    )
    
    let uiImage = try view()
        .environment(\.locale, locale)
        .ignoresSafeArea()
        .snapshot()
    
    guard let data = uiImage.pngData() else {
        throw PNGError()
    }
    
    try data.write(to: screenshotFileURL)
}

struct PNGError: Error {}

extension View {
    func snapshot() -> UIImage {
        let root = self
        let controller = UIHostingController(rootView: root)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

extension String {
    func sanitize() -> String {
        return self
            .replacingOccurrences(of: "\\W+", with: "-", options: .regularExpression)
            .replacingOccurrences(of: "^-|-$", with: "", options: .regularExpression)
    }
}
