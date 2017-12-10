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
    private var shootingState: ShootingState = SingleShootState()

    private enum Constants {
        static let step = 5
    }

    init(cannon: Cannon) {
        self.cannon = cannon
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

    func moveCannonLeft() {
        cannon.location.x -= Constants.step
    }

    func moveCannonRight() {
        cannon.location.x += Constants.step
    }

    func moveCannonUp() {
        cannon.location.y += Constants.step
    }

    func moveCannonDown() {
        cannon.location.y -= Constants.step
    }

    // MARK: GameObjectVisitable

    func accept(visitor: GameObjectVisitor) {
        visitor.visit(object: self)

        birds.forEach { $0.accept(visitor: visitor) }
    }
}
