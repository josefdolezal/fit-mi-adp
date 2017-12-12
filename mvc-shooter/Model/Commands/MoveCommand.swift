//
//  MoveCommand.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

enum MoveDirection {
    case up
    case down
    case right
    case left

    var amount: Int {
        return 10
    }
}

struct MoveCommand: Command {

    private let model: ScreenModelType
    private let direction: MoveDirection

    init(model: ScreenModelType, direction: MoveDirection) {
        self.model = model
        self.direction = direction
    }

    func execute() {
        switch direction {
        case .up: model.moveCannonUp(amount: direction.amount)
        case .down: model.moveCannonDown(amount: direction.amount)
        case .right: model.moveCannonRight(amount: direction.amount)
        case .left: model.moveCannonLeft(amount: direction.amount)
        }
    }
}
