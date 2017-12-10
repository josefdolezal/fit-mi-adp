//
//  SingleShootState.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

struct SingleShootState: ShootingState {
    func shoot(from location: Point, in direction: Point, strategy: ShootingStrategy,
               boundary width: Int, height: Int) -> [BirdModel] {

        let impulse = strategy.impulse(in: direction, boundary: width, height: height)
        let birdModel = BirdModel(bird: Bird(location: location), impuls: impulse)

        return [birdModel]
    }
}
