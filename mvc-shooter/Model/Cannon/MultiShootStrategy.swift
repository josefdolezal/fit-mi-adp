//
//  MultiShootStrategy.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct MultiShootStrategy: ShootingState {
    func shoot(from location: Point, in direction: Point, boundary width: Int, height: Int) -> [BirdModel] {
        return []
    }
}
