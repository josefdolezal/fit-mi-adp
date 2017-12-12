//
//  ChangeShootingStateCommand.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct ChangeShootingState: Command {

    private let model: ScreenModelType
    private let shootingState: ShootingState

    init(model: ScreenModelType, shootingState: ShootingState) {
        self.model = model
        self.shootingState = shootingState
    }

    func execute() {
        model.useShootingState(shootingState)
    }
}
