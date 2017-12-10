//
//  SingleShootState.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

struct SingleShootState: ShootingState {

    private struct Impulse {
        static let maxX = 15.0
        static let maxY = 12.0
    }

    func shoot(from location: Point, in direction: Point, boundary width: Int, height: Int) -> [BirdModel] {
        let impulse = Vector(
            dx: (Double(direction.x) / Double(width) * Impulse.maxX),
            dy: (Double(direction.y) / Double(height) * Impulse.maxY))
        let birdModel = BirdModel(bird: Bird(location: location), impuls: impulse)

        return [birdModel]
    }
}
