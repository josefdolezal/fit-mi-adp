//
//  RemoveBirdCommand.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct RemoveBirdCommand: Command {

    private let model: ScreenModelType
    private let birdModel: BirdModel

    init(model: ScreenModelType, birdModel: BirdModel) {
        self.model = model
        self.birdModel = birdModel
    }

    func execute() {
        model.destroyBird(birdModel)
    }
}
