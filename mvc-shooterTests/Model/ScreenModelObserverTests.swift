//
//  ScreenModelObserverTests.swift
//  mvc-shooterTests
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest
@testable import mvc_shooter

class ScreenModelObserverTests: XCTestCase, ScreenModelObserver {

    var subject: ScreenModel!
    var updatesCounts = 0
    
    override func setUp() {
        super.setUp()

        subject = ScreenModel(configuration: ScreenModelConfiguration(
            maximumPigsCount: 5,
            pigsSpawnFrequency: 5.0,
            objectsFactory: RealisticObjectsFactory(),
            sceneWidth: 320, sceneHeight: 240))

        updatesCounts = 0
    }

    func testObserverIsFreedOnRemoveEvent() {
        subject.add(observer: self)
        subject.moveCannonUp(amount: 0)
        XCTAssertTrue(updatesCounts == 1)

        subject.remove(observer: self)
        subject.moveCannonUp(amount: 0)
        XCTAssertTrue(updatesCounts == 1)
    }

    func testModelNotifiesOnAllEvents() {
        subject.add(observer: self)

        subject.moveCannonUp(amount: 0)
        XCTAssertTrue(updatesCounts == 1)

        subject.moveCannonDown(amount: 0)
        XCTAssertTrue(updatesCounts == 2)

        subject.moveCannonLeft(amount: 0)
        XCTAssertTrue(updatesCounts == 3)

        subject.moveCannonRight(amount: 0)
        XCTAssertTrue(updatesCounts == 4)

        subject.spawnPig()
        XCTAssertTrue(updatesCounts == 5)

        subject.spawnBird(direction: Point(x: 0, y: 0))
        XCTAssertTrue(updatesCounts == 6)

        subject.remove(observer: self)
    }

    // MARK: - ScreenModelObserver

    func modelChanged() {
        updatesCounts += 1
    }
}
