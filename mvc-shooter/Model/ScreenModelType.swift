//
//  ScreenModelType.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol ScreenModelType: class, GameObjectModelVisitable {
    var cannon: CannonModel { get }
    var pigs: [PigModel] { get }
    var birds: [BirdModel] { get }

    // MARK: - Cannon API

    func moveCannonLeft()

    func moveCannonRight()

    func moveCannonUp()
    
    func moveCannonDown()

    // MARK: - Piggies API

    func spawnPig()

    // MARK: - Birds API

    func spawnBird()

    func destroyBird(_ model: BirdModel)

    // MARK: - Observable API

    func add(observer: ScreenModelObserver)

    func remove(observer: ScreenModelObserver)
}
