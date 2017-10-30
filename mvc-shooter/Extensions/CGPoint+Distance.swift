//
//  CGPoint+Distance.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 07/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    func delta(to other: CGPoint) -> CGVector {
        func coordinateDelta(first: CGFloat, second: CGFloat) -> CGFloat {
            let delta = abs(second) - abs(first)

            return second < first ? -delta : delta
        }

        let deltaX = coordinateDelta(first: x, second: other.x)
        let deltaY = coordinateDelta(first: y, second: other.y)

        return CGVector(dx: deltaX, dy: deltaY)
    }
}
