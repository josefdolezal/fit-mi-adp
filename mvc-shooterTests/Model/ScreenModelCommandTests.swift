//
//  ScreenModelCommandTests.swift
//  mvc-shooterTests
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest
@testable import mvc_shooter

class ScreenModelCommandTests: XCTestCase {

    var commandExecutions = 0
    var command: BlockCommandMock!
    var subject: ScreenModel!
    
    override func setUp() {
        super.setUp()

        commandExecutions = 0
        subject = ScreenModel(configuration: ScreenModelConfiguration(
            maximumPigsCount: 2,
            pigsSpawnFrequency: 5.0,
            objectsFactory: RealisticObjectsFactory(),
            sceneWidth: 320,
            sceneHeight: 240))
        command = BlockCommandMock { [weak self] in
            self?.commandExecutions += 1
        }
    }

    func testCommandIsExecutedAfterRefresh() {
        subject.enqueue(command: command)
        XCTAssertTrue(commandExecutions == 0)

        subject.refresh()
        XCTAssertTrue(commandExecutions == 1)
    }

    func testCommandIsCorrectlyDequed() {
        subject.enqueue(command: command)
        subject.refresh()
        XCTAssertTrue(commandExecutions == 1)

        subject.refresh()
        XCTAssertTrue(commandExecutions == 1)
    }
}
