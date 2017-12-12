//
//  ShootCommand.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class ShootCommand: Command {

    private let model: ScreenModelType
    private let direction: Point

    init(model: ScreenModelType, direction: Point) {
        self.model = model
        self.direction = direction
    }

    func execute() {
        model.spawnBird(direction: direction)
    }
}
