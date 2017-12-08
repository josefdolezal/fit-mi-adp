//
//  GameObject.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

class GameObject {

    var location: Point

    init(location: Point) {
        self.location = location
    }

    convenience init(x: Int, y: Int) {
        self.init(location: .init(x: x, y: y))
    }
}
