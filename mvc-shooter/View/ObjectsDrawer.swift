//
//  ObjectsDrawer.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 31/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import UIKit

class ObjectsDrawer: GameObjectVisitor {

    private let cannonImage = Asset.cannon.image

    // MARK: GameObjectModelVisitable

    func visit(object: CannonModel) {
        let cannonRect = CGRect(origin: .init(x: object.locationX(), y: object.locationY()), size: cannonImage.size)

        cannonImage.draw(in: cannonRect)
    }

    func visit(object: BirdModel) {

    }

    func visit(object: PigModel) {

    }
}
