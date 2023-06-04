//
//  VTProjectTests.swift
//  vtTests
//
//  Created by Vincent Tourraine on 03/06/2023.
//

import XCTest
@testable import vt

final class VTProjectTests: XCTestCase {

    func testLoadData() throws {
        let bundle = Bundle(for: VTProjectTests.self)
        let fileURL = try XCTUnwrap(bundle.url(forResource: "projects", withExtension: "json"))
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let objects = try decoder.decode([Project].self, from: data)

        XCTAssertEqual(objects.count, 41)

        let first = try XCTUnwrap(objects.first)
        XCTAssertEqual(first.name, "MyTee")
        XCTAssertEqual(first.slug, "mytee")
        XCTAssertEqual(first.yearStart, 2011)
        XCTAssertEqual(first.platforms, ["web", "iOS"])
        XCTAssertEqual(first.url?.absoluteString, "http://www.studioamanga.com/mytee/")
        XCTAssertEqual(first.screenshots, ["shirt-120.png"])
        XCTAssertEqual(first.screenshotsBig, ["homepage.png", "shirt.png", "shirts.png"])
    }
}
