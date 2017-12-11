//
//  ObjectsFactory.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 11/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol ObjectsFactory: class {
    func bird(location: Point, in direction: Point, boundary width: Int, height: Int) -> BirdModel

    func pig(boundary width: Int, height: Int) -> PigModel
}
