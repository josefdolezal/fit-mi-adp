//
//  ShootingState.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

protocol ShootingState {
    func shoot(from location: Point, in direction: Point, strategy: ShootingStrategy,
               boundary width: Int, height: Int) -> [BirdModel]
}
