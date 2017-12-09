//
//  ScreenModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import CoreGraphics

class ScreenModel: ScreenModelType {
    let cannon: CannonModel
    var configuration: ScreenModelConfiguration
    
    private var observers: [ScreenModelObserver]

    private(set) var birds: [BirdModel]
    private(set) var pigs: [PigModel]

    init(configuration: ScreenModelConfiguration) {
        self.cannon = CannonModel(cannon: Cannon(location: .init(x: 0, y: 0 )))
        self.observers = []
        self.birds = []
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

    // MARK: - Birds API

    func spawnBird() {
        let anchorPoint = Point(x: cannon.locationX(), y: cannon.locationY())
        let birdModel = BirdModel(bird: Bird(location: anchorPoint))

        birds.append(birdModel)

        notifyObservers()
    }

    func destroyBird(_ model: BirdModel) {
        guard let index = birds.index(of: model) else { return }

        birds.remove(at: index)
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
        birds.forEach { $0.accept(visitor: visitor) }
        pigs.forEach { $0.accept(visitor: visitor) }
    }
}
