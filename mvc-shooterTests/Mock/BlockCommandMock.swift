//
//  BlockCommandMock.swift
//  mvc-shooterTests
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

@testable import mvc_shooter

class BlockCommandMock: Command {
    private var operation: () -> Void

    init(operation: @escaping () -> Void) {
        self.operation = operation
    }

    func execute() {
        operation()
    }
}
