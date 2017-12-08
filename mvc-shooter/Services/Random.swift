//
//  Random.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct Random {
    static func next(upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
}
