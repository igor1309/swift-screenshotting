//
//  MakeFileAndDirectoryURLsTests.swift
//  AppStorePreviewingTests
//
//  Created by Igor Malyarov on 11.09.2022.
//

@testable import Screenshotting
import XCTest

final class MakeFileAndDirectoryURLsTests: XCTestCase {
    func test_sanitize() {
        let sut = "ru * RU / iPhone \\ 13 Pro"
        XCTAssertEqual(sut.sanitize(), "ru-RU-iPhone-13-Pro")
    }
    
    func test_makeFileAndDirectoryURLs_emptyDirectoryNameReplacedWithDashes() throws {
        let locale: Locale = .init(identifier: "ru-RU")
        let device: Device = .iPhone13ProMax
        
        let (directoryURL, fileURL) = makeFileAndDirectoryURLs(
            locale: locale,
            device: device,
            directory: nil,
            directoryName: "",
            file: #file,
            testName: #function
        )
        
        try assert(directoryURL, locale, "___")
        try assert(fileURL, locale, device, "___")
        try assert(directoryURL, fileURL, locale, device, "___")
    }
    
    func test_makeFileAndDirectoryURLs_nonEmptyDirectoryName() throws {
        let locale: Locale = .init(identifier: "ru-RU")
        let device: Device = .iPhone13ProMax
        let directoryName = "Screenshots"
        
        let (directoryURL, fileURL) = makeFileAndDirectoryURLs(
            locale: locale,
            device: device,
            directory: nil,
            directoryName: directoryName,
            file: #file,
            testName: #function
        )
        
        try assert(directoryURL, locale, directoryName)
        try assert(fileURL, locale, device, directoryName)
        try assert(directoryURL, fileURL, locale, device, directoryName)
    }
    
    func test_subPath() throws {
        let sub = try subPath(of: URL(fileURLWithPath: "\(#file)"))
        let last = URL(fileURLWithPath: "\(#file)", isDirectory: false)
            .lastPathComponent
        XCTAssertEqual(sub.dropFirst(), last[...])
    }
    
    func test_subPath_throwsOnBadURL() throws {
        _ = try XCTExpectFailure {
            try subPath(of: URL(string: "any-url")!)
        }
    }
    
    // MARK: - Helpers
    
    private func assert(
        _ directoryURL: URL,
        _ fileURL: URL,
        _ locale: Locale,
        _ device: Device,
        _ subDirectory: String,
        file: StaticString = #file,
        line: UInt = #line
    ) throws {
        try assert(directoryURL, locale, subDirectory, file: file, line: line)
        try assert(fileURL, locale, device, subDirectory, file: file, line: line)
    }
    
    private func assert(
        _ fileURL: URL,
        _ locale: Locale,
        _ device: Device,
        _ subDirectory: String,
        file: StaticString = #file,
        line: UInt = #line
    ) throws {
        let subDirectory = "/\(subDirectory)/\(locale.identifier)"[...]
        let fileSubPath = try subPath(of: fileURL)
        XCTAssert(fileSubPath.hasPrefix(subDirectory), file: file, line: line)
        
        let fileNamePrefix = "\(locale.identifier)-\(device.name)".sanitize()
        let fileNamePrefixWithSubDirectory = "\(subDirectory)/\(fileNamePrefix)-"[...]
        let count = fileNamePrefixWithSubDirectory.count
        
        XCTAssertEqual(fileSubPath.prefix(count), fileNamePrefixWithSubDirectory, file: file, line: line)
        XCTAssert(fileSubPath.hasPrefix(fileNamePrefixWithSubDirectory), file: file, line: line)
        XCTAssert(fileSubPath.deletingPrefix(subDirectory + "/").hasPrefix(fileNamePrefix), file: file, line: line)
    }
    
    private func assert(
        _ directoryURL: URL,
        _ locale: Locale,
        _ subDirectory: String,
        file: StaticString = #file,
        line: UInt = #line
    ) throws {
        let directorySubPath = try subPath(of: directoryURL)
        let subDirectory = "/\(subDirectory)/\(locale.identifier)"[...]
        XCTAssertEqual(directorySubPath, subDirectory, file: file, line: line)
    }
    
    /// Return a part of the path after the module name.
    private func subPath(
        of directoryURL: URL,
        file: StaticString = #file,
        line: UInt = #line
    ) throws -> Substring {
        let moduleName = String("\(#fileID)").prefix { $0 != "/" }
        let path = directoryURL.absoluteString
        let range = try XCTUnwrap(
            path.range(of: moduleName),
            "Error: directoryURL does not contain module name.",
            file: file, line: line
        )
        let subPath = path[range.upperBound...]
        
        return subPath
    }
}

extension Substring {
    func deletingPrefix(_ prefix: Substring) -> Substring {
        guard self.hasPrefix(prefix) else { return self }
        return self.dropFirst(prefix.count)
    }
}
