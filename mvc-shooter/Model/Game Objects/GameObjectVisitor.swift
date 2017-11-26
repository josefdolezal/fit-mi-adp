//
//  GameObjectVisitor.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 26/11/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol GameObjectVisitor: class {
    func visit(object: CannonModel)
    func visit(object: BirdModel)
    func visit(object: PigModel)
}
