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
    
    private var birds: [BirdModel]
    private var pigs: [PigModel]
    private var observers: [ScreenModelObserver]

    init() {
        self.cannon = CannonModel(cannon: Cannon(location: .init(x: 0, y: 0 )))
        self.birds = []
        self.pigs = []
        self.observers = []
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
