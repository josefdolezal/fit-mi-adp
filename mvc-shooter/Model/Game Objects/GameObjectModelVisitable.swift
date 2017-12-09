//
//  GameObjectModelVisitable.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 26/11/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol GameObjectModelVisitable {
    func accept(visitor: GameObjectVisitor)
}
