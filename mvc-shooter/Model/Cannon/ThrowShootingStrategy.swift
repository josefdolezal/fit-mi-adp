//
//  ThrowShootingStrategy.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 11/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class ThrowShootingStrategy: ShootingStrategy {

    private let maxImpulse: Double = 22

    func impulse(in direction: Point, boundary width: Int, height: Int) -> Vector {
        return Vector(dx: (Double(direction.x) / Double(width)) * maxImpulse, dy: 0)
    }
}
