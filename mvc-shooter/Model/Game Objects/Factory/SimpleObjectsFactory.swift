//
//  SimpleObjectsFactory.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 11/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class SimpleObjectsFactory: ObjectsFactory {

    private let strategy = ThrowShootingStrategy()

    func bird(location: Point, in direction: Point, boundary width: Int, height: Int) -> BirdModel {
        let impulse = strategy.impulse(in: direction, boundary: width, height: height)

        return BirdModel(bird: Bird(location: location), impuls: impulse)
    }

    func pig(boundary width: Int, height: Int) -> PigModel {
        let randomX = Random.next(upperBound: width)
        let randomY = Random.next(upperBound: height)

        return PigModel(pig: Pig(x: randomX, y: randomY))
    }
}
