//
//  PigModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class PigModel: GameObjectModelVisitable {
    private let pig: Pig

    init(pig: Pig) {
        self.pig = pig
    }

    // MARK: GameObjectModelVisitable

    func accept(visitor: GameObjectVisitor) {
        visitor.visit(object: self)
    }
}
