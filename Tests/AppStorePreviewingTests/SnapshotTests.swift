//
//  SnapshotTests.swift
//
//
//  Created by Igor Malyarov on 10.09.2022.
//

import AppStorePreviewing
import Screenshotting
import SwiftUI
import XCTest

final class SnapshotTests: XCTestCase {
    func test_view_snapshot() throws {
        let data = try dataContentsOf("View.png")
        let snapshot = try makeView().snapshot(scale: 2)
        
        XCTAssertEqual(data, snapshot)
    }
    
    func test_url() throws {
        XCTAssertEqual(makeURLInResources(name: "View", with: "png").absoluteString, "")
    }

    func test_recordView() throws {
        let url = makeURLInResources(name: "View", with: "png")
        let view = makeView()
        let data = try view.snapshot(scale: 2)
        try data.write(to: url)
    }
    
    // MARK: - Helpers
    
    private func dataContentsOf(_ filename: String) throws -> Data {
        let bundle: Bundle = .init(for: Self.self)
        let url = try XCTUnwrap(
            bundle.url(forResource: "View", withExtension: "png")
        )
        let data = try Data(contentsOf: url)
        
        return data
    }
    
    private func makeURLInResources(
        name: String,
        with ext: String,
        file: StaticString = #file
    ) -> URL {
        URL(fileURLWithPath: "\(file)", isDirectory: false)
            .deletingLastPathComponent()
            .appendingPathComponent("Resources")
            .appendingPathComponent(name)
            .appendingPathExtension(ext)
    }
    
    private func makeView() -> some View {
        AppStorePreview(
            device: .iPhone13Pro,
            background: Color.green,
            marketing: marketing,
            content: content
        )
        .environment(\.locale, .init(identifier: "ru-RU"))
    }
    
    private func marketing() -> some View {
        Text("TBD: App Store Marketing Text")
            .foregroundColor(.white)
            .font(.system(.largeTitle, design: .serif))
            .padding()
    }
    
    private func content() -> some View {
        NavigationView {
            List(0..<10) {
                Text("Row number \($0)")
            }
            .navigationTitle("Content")
            .redacted(reason: .placeholder)
        }
    }
}

