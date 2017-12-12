//
//  Pig.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class Pig: GameObject {

    // MARK: Deep copy

    func copy() -> Pig {
        return Pig(location: location)
    }
}
