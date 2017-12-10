//
//  BalisticShootingStrategy.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 10/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct BalisticShootingStrategy: ShootingStrategy {

    private struct Impulse {
        static let maxX = 15.0
        static let maxY = 12.0
    }

    func impulse(in direction: Point, boundary width: Int, height: Int) -> Vector {
        return Vector(
            dx: (Double(direction.x) / Double(width)) * Impulse.maxX,
            dy: (Double(direction.y) / Double(height)) * Impulse.maxY)
    }
}
