//
//  SingleShootState.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

struct SingleShootState: ShootingState {

    var factory: ObjectsFactory

    func shoot(from location: Point, in direction: Point, boundary width: Int, height: Int) -> [BirdModel] {
        return [factory.bird(location: location, in: direction, boundary: width, height: height)]
    }
}
