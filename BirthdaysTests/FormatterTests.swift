//
//  FormatterTests.swift
//  BirthdaysTests
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

@testable import Birthdays
import XCTest

class FormatterTests: XCTestCase {
    private var systemUnderTest: Formatter!

    override func setUpWithError() throws {
        systemUnderTest = Formatter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormatNameAsSignature() {
        let firstName = "Mehmet"
        let lastName = "Tarhan"
        
        XCTAssertEqual(systemUnderTest.formatNameAsSignature(first: firstName, last: lastName), "MT")
    }
}
