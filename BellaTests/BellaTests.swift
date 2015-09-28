//
//  BellaTests.swift
//  BellaTests
//
//  Created by skyline on 15/9/28.
//  Copyright © 2015年 skyline. All rights reserved.
//

import XCTest
@testable import Bella

class BellaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSimple() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let options: Extension = [.EXT_FENCED_CODE, .EXT_AUTOLINK]
        let realOutput = Bella.render("### Hello", ext: options)
        let expectOutput = "<h3>Hello</h3>\n"
        XCTAssertEqual(realOutput, expectOutput)
    }
    
}
