//
//  NodeCategory.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

enum NodeCategory {
    case bird
    case pig

    var identifier: UInt32 {
        switch self {
        case .bird: return 0x1 << 1
        case .pig: return 0x1 << 2
        }
    }
}
