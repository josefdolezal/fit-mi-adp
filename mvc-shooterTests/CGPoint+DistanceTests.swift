//
//  CGPoint+DistanceTests.swift
//  mvc-shooterTests
//
//  Created by Josef Dolezal on 07/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import CoreGraphics
import XCTest
@testable import mvc_shooter

class CGPoint_DistanceTests: XCTestCase {
    
    func testEqualPointsHaveZeroDelta() {
        let first = CGPoint(x: 10, y: 10)
        let second = CGPoint(x: 10, y: 10)

        XCTAssertEqual(first.delta(to: second), CGVector.zero)
    }

    func testPositivePointsHavePositiveDelta() {
        let first = CGPoint(x: 10, y: 10)
        let second = CGPoint(x: 20, y: 15)

        XCTAssertEqual(first.delta(to: second), CGVector(dx: 10, dy: 5))
    }

    func testNegativePointsHaveNegativeDelta() {
        let first = CGPoint(x: -10, y: -10)
        let second = CGPoint(x: -20, y: -15)

        XCTAssertEqual(first.delta(to: second), CGVector(dx: -10, dy: -5))
    }
    
}
