//
//  NodeCategory.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

enum NodeCategory: Int {
    case bird = 1
    case pig

    var identifier: UInt32 {
        return 0x1 << rawValue
    }
}
