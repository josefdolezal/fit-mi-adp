//
//  BirdModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class BirdModel: Equatable {

    private let bird: Bird

    // MARK: - Initializers

    init(bird: Bird) {
        self.bird = bird
    }

    // MARK: - Location API

    func locationX() -> Int {
        return bird.location.x
    }

    func locationY() -> Int {
        return bird.location.y
    }

    // MARK: - Equatable

    static func ==(lhs: BirdModel, rhs: BirdModel) -> Bool {
        return lhs === rhs
    }
}
