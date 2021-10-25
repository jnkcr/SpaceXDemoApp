//
//  ExtensionsTests.swift
//  SpaceXDemoAppTests
//
//  Created by Jan Kučera on 25.10.2021.
//

import XCTest
@testable import SpaceXDemoApp


class ExtensionsTests: XCTestCase {
    
    let dateString: String = "2021-10-01T09:30:00+02:00"
    
    func testFormattingOfISO8601Time() {
        let dateOnly    = dateString.formatted()
        let timeOnly    = dateString.formatted(dateFormat: .omitted, timeFormat: .standard)
        let dateAndTime = dateString.formatted(dateFormat: .abbreviated, timeFormat: .standard)
        
        // Applies to CS locale
        XCTAssertEqual(dateOnly, "1. 10. 2021")
        XCTAssertEqual(timeOnly, "9:30:00")
        XCTAssertEqual(dateAndTime, "1. 10. 2021 9:30:00")
    }
    
}
