//
//  BirdModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class BirdModel: GameObjectModelVisitable {

    private let bird: Bird

    init(bird: Bird) {
        self.bird = bird
    }

    // MARK: GameObjectModelVisitable

    func accept(visitor: GameObjectVisitor) {
        visitor.visit(object: self)
    }
}
