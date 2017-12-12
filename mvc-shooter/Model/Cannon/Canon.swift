//
//  Canon.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class Cannon: GameObject {
    // MARK: Deep copy

    func copy() -> Cannon {
        return Cannon(location: location)
    }
}
