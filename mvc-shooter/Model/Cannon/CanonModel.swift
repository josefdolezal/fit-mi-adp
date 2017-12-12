//
//  CanonModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class CannonModel: GameObjectModelVisitable {

    private let cannon: Cannon

    private var birds = [BirdModel]()
    private var shootingState: ShootingState

    init(cannon: Cannon, shootingState: ShootingState) {
        self.cannon = cannon
        self.shootingState = shootingState
    }

    // - MARK: Location API

    func locationX() -> Int {
        return cannon.location.x
    }

    func locationY() -> Int {
        return cannon.location.y
    }

    // MARK: - Shooting API

    func useShootingState(_ shootingState: ShootingState) {
        self.shootingState = shootingState
    }

    func shootBird(in direction: Point, widthBoundary: Int, heightBoundary: Int) {
        let newBirds = shootingState.shoot(from: cannon.location, in: direction,
                                           boundary: widthBoundary, height: heightBoundary)

        birds.append(contentsOf: newBirds)
    }

    func destroyBird(_ model: BirdModel) {
        guard let index = birds.index(of: model) else { return }

        birds.remove(at: index)
    }

    // - MARK: Moving API

    func moveCannonLeft(amount: Int) {
        cannon.location.x -= amount
    }

    func moveCannonRight(amount: Int) {
        cannon.location.x += amount
    }

    func moveCannonUp(amount: Int) {
        cannon.location.y += amount
    }

    func moveCannonDown(amount: Int) {
        cannon.location.y -= amount
    }

    // MARK: GameObjectVisitable

    func accept(visitor: GameObjectVisitor) {
        visitor.visit(object: self)

        birds.forEach { $0.accept(visitor: visitor) }
    }
}
