//
//  ScreenModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import CoreGraphics

class ScreenModel: ScreenModelType {
    private let cannon: CannonModel
    private var birds: [BirdModel]
    private var pigs: [PigModel]

    init() {
        self.cannon = CannonModel(cannon: Cannon(location: .init(x: 0, y: 0 )))
        self.birds = []
        self.pigs = []
    }
}
