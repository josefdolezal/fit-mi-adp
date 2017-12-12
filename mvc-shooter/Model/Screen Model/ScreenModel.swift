//
//  ScreenModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import CoreGraphics

class ScreenModel: ScreenModelType, GameObjectModelVisitable {

    private struct GameSave {
        let cannon: CannonModel
        let pigs: [PigModel]
    }

    var configuration: ScreenModelConfiguration

    private var observers: [ScreenModelObserver]
    private var cannon: CannonModel
    private var pigs: [PigModel]
    private var commands = [Command]()

    init(configuration: ScreenModelConfiguration) {
        self.cannon = CannonModel(
            cannon: Cannon(location: Point(x: 20, y: Int(configuration.sceneHeight / 2))),
            shootingState: SingleShootState(factory: configuration.objectsFactory))
        self.observers = []
        self.pigs = []
        self.configuration = configuration
    }

    // MARK: - Cannon API

    func moveCannonLeft(amount: Int) {
        cannon.moveCannonLeft(amount: amount)

        notifyObservers()
    }

    func moveCannonRight(amount: Int) {
        cannon.moveCannonRight(amount: amount)

        notifyObservers()
    }

    func moveCannonUp(amount: Int) {
        cannon.moveCannonUp(amount: amount)

        notifyObservers()
    }

    func moveCannonDown(amount: Int) {
        cannon.moveCannonDown(amount: amount)

        notifyObservers()
    }

    // MARK: - Piggies API

    func spawnPig() {
        guard pigs.count < configuration.maximumPigsCount else { return }

        let pigModel = configuration.objectsFactory.pig(boundary: configuration.sceneWidth,
                                                        height: configuration.sceneHeight)

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

    // MARK: - Commands API

    func enqueue(command: Command) {
        commands.append(command)
    }

    // MARK: - Time API

    func refresh() {
        while !commands.isEmpty {
            let command = commands.removeFirst()

            SaveGameManager.shared.save(data: save())
            command.execute()
        }
    }

    // MARK: - GameObjectModelVisitable

    func accept(visitor: GameObjectVisitor) {
        cannon.accept(visitor: visitor)
        pigs.forEach { $0.accept(visitor: visitor) }
    }

    // MARK: - Save game API

    func save() -> Any {
        return GameSave(cannon: cannon.copy(), pigs: pigs.map { $0.copy() })
    }

    func load(from data: Any) {
        guard let save = data as? GameSave else { return }

        self.cannon = save.cannon
        self.pigs = save.pigs
    }
}
