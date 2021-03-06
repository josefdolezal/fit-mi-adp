//
//  ScreenModelType.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol ScreenModelType: class, GameObjectModelVisitable {
    var configuration: ScreenModelConfiguration { get set }

    // MARK: - Cannon API

    func moveCannonLeft(amount: Int)

    func moveCannonRight(amount: Int)

    func moveCannonUp(amount: Int)
    
    func moveCannonDown(amount: Int)

    // MARK: - Piggies API

    func spawnPig()

    func destroyPig(_ model: PigModel)

    // MARK: - Birds API

    func spawnBird(direction: Point)

    func destroyBird(_ model: BirdModel)

    // MARK: - Cannon API

    func useShootingState(_ shootingState: ShootingState)

    // MARK: - Observable API

    func add(observer: ScreenModelObserver)

    func remove(observer: ScreenModelObserver)

    // MARK: - Time API

    func refresh()

    // MARK: - Commands API

    func enqueue(command: Command)

    // MARK: - Save game API

    func save() -> Any

    func load(from data: Any)
}
