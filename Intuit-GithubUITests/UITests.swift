//
//  UITests.swift
//  Intuit-GithubUITests
//
//  Created by Romario Latty on 10/10/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import XCTest


class UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
                        
    }
    
    func testOneValidUser(){
        let goodData: [String: Any] = [
            "id": 1234,
            "login": "Romo",
            "avatar_url": "avatar_url",
            "type": "owner"
        ]
        let user1 = User(data: goodData)
        XCTAssertTrue(user1 != nil)
        
    }
    func testOneInvalidUser(){
        let goodData: [String: Any] = [
            "login": "Romo",
            "avatar_url": "avatar_url",
            "type": "owner"
        ]
        let user1 = User(data: goodData)
        XCTAssertTrue(user1 == nil)
        
    }

}
