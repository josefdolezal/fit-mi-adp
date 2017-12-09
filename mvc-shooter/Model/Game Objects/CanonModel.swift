//
//  CanonModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class CannonModel: GameObjectModelVisitable {

    struct Preferences {
        static let maximumInpulsX: Double = 15
        static let maximumInpulsY: Double = 12
    }

    private let cannon: Cannon
    private var birds = [BirdModel]()

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

    func shootBird(in direction: Point, widthBoundary: Int, heightBoundary: Int) {
        let impuls = birdImpulse(in: direction, boundary: widthBoundary, height: heightBoundary)
        let birdModel = BirdModel(bird: Bird(location: cannon.location),
                                  impuls: impuls)

        birds.append(birdModel)
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

    // MARK: - Computations

    private func birdImpulse(in direction: Point, boundary width: Int, height: Int) -> Vector {
        return Vector(
            dx: (Double(direction.x) / Double(width) * Preferences.maximumInpulsX),
            dy: (Double(direction.y) / Double(height) * Preferences.maximumInpulsY))
    }
}
