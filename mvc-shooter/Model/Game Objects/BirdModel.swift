//
//  BirdModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class BirdModel: GameObjectModelVisitable, Equatable {

    private let bird: Bird
    private let impuls: Vector

    // MARK: - Initializers

    init(bird: Bird, impuls: Vector) {
        self.bird = bird
        self.impuls = impuls
    }

    // MARK: - Location API

    func locationX() -> Int {
        return bird.location.x
    }

    func locationY() -> Int {
        return bird.location.y
    }

    func directionAngle() -> Double {
        return impuls.dy
    }

    func force() -> Double {
        return impuls.dx
    }

    // MARK: GameObjectModelVisitable

    func accept(visitor: GameObjectVisitor) {
        visitor.visit(object: self)
    }

    // MARK: - Equatable

    static func ==(lhs: BirdModel, rhs: BirdModel) -> Bool {
        return lhs === rhs
    }
}
