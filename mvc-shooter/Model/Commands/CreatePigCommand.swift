//
//  CreatePigCommand.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct CreatePigCommand: Command {

    private let model: ScreenModelType

    init(model: ScreenModelType) {
        self.model = model
    }

    func execute() {
        model.spawnPig()
    }
}
