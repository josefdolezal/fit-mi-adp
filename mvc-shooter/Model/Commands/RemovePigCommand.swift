//
//  RemovePigCommand.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct RemovePigCommand: Command {

    private let model: ScreenModelType
    private let pigModel: PigModel

    init(model: ScreenModelType, pigModel: PigModel) {
        self.model = model
        self.pigModel = pigModel
    }

    func execute() {
        model.destroyPig(pigModel)
    }
}
