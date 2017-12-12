//
//  SimpleObjectsFactory.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 11/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class SimpleObjectsFactory: ObjectsFactory {

    struct Offsets {
        static let x = 30
        static let y = 100
    }

    private let strategy = ThrowShootingStrategy()

    func bird(location: Point, in direction: Point, boundary width: Int, height: Int) -> BirdModel {
        let impulse = strategy.impulse(in: direction, boundary: width, height: height)

        return BirdModel(bird: Bird(location: location), impuls: impulse)
    }

    func pig(boundary width: Int, height: Int) -> PigModel {
        let randomX = Random.next(upperBound: width - (2 * Offsets.x)) + Offsets.x
        let randomY = Random.next(upperBound: height - (2 * Offsets.y)) + Offsets.y

        return PigModel(pig: Pig(x: randomX, y: randomY))
    }
}
