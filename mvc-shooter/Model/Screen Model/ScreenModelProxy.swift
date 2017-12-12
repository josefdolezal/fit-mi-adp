//
//  ScreenModelProxy.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class ScreenModelProxy: ScreenModelType {
    var configuration: ScreenModelConfiguration {
        didSet {
            self.model.configuration = configuration
        }
    }

    private let model: ScreenModelType
    private let loggingService: LogService

    init(configuration: ScreenModelConfiguration, model: ScreenModelType, loggingService: LogService) {
        self.configuration = configuration
        self.model = model
        self.loggingService = loggingService
    }

    // MARK: - Cannon API

    func moveCannonLeft(amount: Int) {
        loggingService.log(message: "Moving cannon left.")
        model.moveCannonLeft(amount: amount)
    }

    func moveCannonRight(amount: Int) {
        loggingService.log(message: "Moving cannon right.")
        model.moveCannonRight(amount: amount)
    }

    func moveCannonUp(amount: Int) {
        loggingService.log(message: "Moving cannon up.")
        model.moveCannonUp(amount: amount)
    }

    func moveCannonDown(amount: Int) {
        loggingService.log(message: "Moving cannon down.")
        model.moveCannonDown(amount: amount)
    }

    func useShootingState(_ shootingState: ShootingState) {
        loggingService.log(message: "Changing shooting state.")
    }

    // MARK: - Pig API

    func spawnPig() {
        loggingService.log(message: "Spawning new pig.")
        model.spawnPig()
    }

    func destroyPig(_ model: PigModel) {
        loggingService.log(message: "Destroying pig.")
        self.model.destroyPig(model)
    }

    // MARK: Bird API

    func spawnBird(direction: Point) {
        loggingService.log(message: "Spawning bird.")
        model.spawnBird(direction: direction)
    }

    func destroyBird(_ model: BirdModel) {
        loggingService.log(message: "Destroying bird.")
        self.model.destroyBird(model)
    }

    // MARK: - Observer API

    func add(observer: ScreenModelObserver) {
        loggingService.log(message: "Adding new observer.")
        model.add(observer: observer)
    }

    func remove(observer: ScreenModelObserver) {
        loggingService.log(message: "Removing observer.")
        model.remove(observer: observer)
    }

    // MARK: - Time API

    func refresh() {
//        loggingService.log(message: "Refreshing model.")
        model.refresh()
    }

    // MARK: - Commands API

    func enqueue(command: Command) {
        loggingService.log(message: "Adding new command.")
        model.enqueue(command: command)
    }

    // MARK: - GameObjectModelVisitable

    func accept(visitor: GameObjectVisitor) {
//        loggingService.log(message: "Accepting visiton.")
        model.accept(visitor: visitor)
    }

    // MARK: Save game API

    func save() -> Any {
        loggingService.log(message: "Creating save.")
        return model.save()
    }

    func load(from data: Any) {
        loggingService.log(message: "Loading save.")
        model.load(from: data)
    }
}
