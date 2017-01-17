//
//  SessionTests.swift
//  SessionTests holds all of the tests for the Session Class.
//
//  Created by Audrey Seo on 27/12/2016.
//  Copyright © 2016 Audrey Seo. All rights reserved.
//

import XCTest
@testable import cubeTimer

class SessionTests: XCTestCase {
	var s:Session!
    
    override func setUp() {
        super.setUp()
		s = Session(name: "hey")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatGetNameGetsName() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
		// Given
		let name = "hey"
		
		// When
		let result = s.getName()
		
		// Then
		XCTAssert(name == result, "getName() does not return the correct name.")
		XCTAssert(result != "gibberish", "getName() returns gibberish")
    }
    
    func DISABLED_testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
