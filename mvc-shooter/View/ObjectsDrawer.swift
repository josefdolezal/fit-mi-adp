//
//  ObjectsDrawer.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 31/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import UIKit

class ObjectsDrawer {

    private let cannonImage = Asset.cannon.image

    public func drawCannon(cannon: CannonModel) {
        let cannonRect = CGRect(x: cannon.locationX(), y: cannon.locationY(),
                                width: cannonImage.size.width, height: cannonImage.size.height)

        cannonImage.draw(in: cannonRect)
    }
}
