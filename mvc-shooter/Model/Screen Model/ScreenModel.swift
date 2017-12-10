//
//  ScreenModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import CoreGraphics

class ScreenModel: ScreenModelType, GameObjectModelVisitable {

    var configuration: ScreenModelConfiguration

    private var observers: [ScreenModelObserver]
    private let cannon: CannonModel
    private var pigs: [PigModel]

    init(configuration: ScreenModelConfiguration) {
        self.cannon = CannonModel(cannon: Cannon(location: .init(x: 20, y: Int(configuration.sceneHeight/2))))
        self.observers = []
        self.pigs = []
        self.configuration = configuration
    }

    // MARK: - Cannon API

    func moveCannonLeft() {
        cannon.moveCannonLeft()

        notifyObservers()
    }

    func moveCannonRight() {
        cannon.moveCannonRight()

        notifyObservers()
    }

    func moveCannonUp() {
        cannon.moveCannonUp()

        notifyObservers()
    }

    func moveCannonDown() {
        cannon.moveCannonDown()

        notifyObservers()
    }

    // MARK: - Piggies API

    func spawnPig() {
        guard pigs.count < configuration.maximumPigsCount else { return }

        let randomX = Random.next(upperBound: configuration.sceneWidth)
        let randomY = Random.next(upperBound: configuration.sceneHeight)
        let pigModel = PigModel(pig: Pig(x: randomX, y: randomY))

        pigs.append(pigModel)

        notifyObservers()
    }

    func destroyPig(_ model: PigModel) {
        guard let index = pigs.index(of: model) else { return }

        pigs.remove(at: index)
    }

    // MARK: - Birds API

    func spawnBird(direction: Point) {
        cannon.shootBird(in: direction, widthBoundary: configuration.sceneWidth,
                         heightBoundary: configuration.sceneHeight)

        notifyObservers()
    }

    func destroyBird(_ model: BirdModel) {
        cannon.destroyBird(model)
    }

    // MARK: - Cannon API

    func useShootingState(_ shootingState: ShootingState) {
        cannon.useShootingState(shootingState)
    }

    // MARK: - Observable API

    func add(observer: ScreenModelObserver) {
        self.observers.append(observer)
    }

    func remove(observer: ScreenModelObserver) {
        self.observers = observers.filter { $0 !== observer }
    }

    private func notifyObservers() {
        observers.forEach { $0.modelChanged() }
    }

    // MARK: GameObjectModelVisitable

    func accept(visitor: GameObjectVisitor) {
        cannon.accept(visitor: visitor)
        pigs.forEach { $0.accept(visitor: visitor) }
    }
}
