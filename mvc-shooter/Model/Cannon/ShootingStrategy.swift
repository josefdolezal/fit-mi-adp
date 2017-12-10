//
//  ShootingStrategy.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 10/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol ShootingStrategy {
    func impulse(in direction: Point, boundary width: Int, height: Int) -> Vector
}
