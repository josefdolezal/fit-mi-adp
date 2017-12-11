//
//  BattleSceneDelegate.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 11/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol BattleSceneDelegate: class {

    func battleScene(didChangeCannonDirection direction: Point)

    func battleScene(shouldClear pigModel: PigModel)

    func battleScene(shouldClear birdModel: BirdModel)

    func battleSceneShouldSpawnPig()

    func battleSceneSpawnInterval() -> TimeInterval

    func battleScene(collidate birdModel: BirdModel, with pigModel: PigModel)
}
