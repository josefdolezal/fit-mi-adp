//
//  CanonModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class CannonModel {
    private let cannon: Cannon

    init(cannon: Cannon) {
        self.cannon = cannon
    }

    // MARK: Location API

    func locationX() -> Int {
        return cannon.location.x
    }

    func locationY() -> Int {
        return cannon.location.y
    }

    // MARK: Moving API

    func moveCannonLeft() {
        cannon.location.x -= 5
    }

    func moveCannonRight() {
        cannon.location.x += 5
    }

    func moveCannonUp() {
        cannon.location.y -= 5
    }

    func moveCannonDown() {
        cannon.location.y += 5
    }
}
