//
//  ScreenModelVisitorTests.swift
//  mvc-shooterTests
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest
@testable import mvc_shooter

class ScreenModelVisitorTests: XCTestCase {

    var subject: ScreenModel!
    var visitor: ObjectsVisitorMock!

    var visitedBirds = 0
    var visitedCannons = 0
    var visitedPigs = 0

    override func setUp() {
        super.setUp()

        subject = ScreenModel(configuration: ScreenModelConfiguration(
            maximumPigsCount: 5,
            pigsSpawnFrequency: 5.0,
            objectsFactory: RealisticObjectsFactory(),
            sceneWidth: 320,
            sceneHeight: 240))
        visitor = ObjectsVisitorMock(
            visitPigModel: { [weak self] in self?.visitedPigs += 1},
            visitBirdModel: { [weak self] in self?.visitedBirds += 1},
            visitCannonModel: { [weak self] in self?.visitedCannons += 1 })

        visitedBirds = 0
        visitedCannons = 0
        visitedPigs = 0
    }

    func testVisitorCallsAllObjects() {
        subject.spawnPig()
        subject.spawnBird(direction: Point(x: 0, y: 0))

        XCTAssertTrue(visitedPigs == 0)
        XCTAssertTrue(visitedBirds == 0)
        XCTAssertTrue(visitedCannons == 0)

        subject.accept(visitor: visitor)

        XCTAssertTrue(visitedPigs > 0)
        XCTAssertTrue(visitedBirds > 0)
        XCTAssertTrue(visitedCannons > 0)
    }
}
