//
//  ScreenModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import CoreGraphics

class ScreenModel {
    private let cannon: Cannon
    private var birds: [Bird]
    private var pigs: [Pig]

    init() {
        self.cannon = Cannon(location: CGPoint(x: 0, y: 0))
        self.birds = []
        self.pigs = []
    }
}
