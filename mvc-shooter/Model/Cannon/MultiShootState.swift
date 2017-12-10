//
//  MultiShootState.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct MultiShootState: ShootingState {

    private let singleShoot = SingleShootState()

    func shoot(from location: Point, in direction: Point, strategy: ShootingStrategy, boundary width: Int, height: Int) -> [BirdModel] {
        let birds = [{ $0 + 50 }, { $0 - 50 }]
            .map { modify(direction: direction, using: $0) }
            .flatMap { singleShoot.shoot(from: location, in: $0, strategy: strategy, boundary: width, height: height) }

        return birds
    }

    private func modify(direction: Point, using: (Int) -> Int) -> Point {
        return Point(x: using(direction.x), y: using(direction.y))
    }
}
