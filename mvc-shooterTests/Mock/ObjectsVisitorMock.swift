//
//  ObjectsVisitorMock.swift
//  mvc-shooterTests
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

@testable import mvc_shooter

class ObjectsVisitorMock: GameObjectVisitor {

    private let visitPigModel: () -> Void
    private let visitBirdModel: () -> Void
    private let visitCannonModel: () -> Void

    init(visitPigModel: @escaping () -> Void, visitBirdModel: @escaping  () -> Void, visitCannonModel: @escaping () -> Void) {
        self.visitPigModel = visitPigModel
        self.visitBirdModel = visitBirdModel
        self.visitCannonModel = visitCannonModel
    }

    func visit(object: PigModel) {
        visitPigModel()
    }

    func visit(object: BirdModel) {
        visitBirdModel()
    }

    func visit(object: CannonModel) {
        visitCannonModel()
    }
}
