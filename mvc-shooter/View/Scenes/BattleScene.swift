//
//  BattleScene.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import SpriteKit

class BattleScene: SKScene, ScreenModelObserver {

    enum Constants {
        static let maximumEnemies = 8
        static let enemySpawnInterval: TimeInterval = 3
    }

    private let model: ScreenModelType

    private let cannonNode: CannonNode
    private var pigNodes = [PigNode]()
    private var birdNodes = [BirdNode]()

    // MARK: - Initializers

    init(model: ScreenModelType) {
        self.model = model
        self.cannonNode = CannonNode(model: model.cannon)

        super.init(size: .zero)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented, use init(model:) instead")
    }

    // MARK: - ScreenModelObserver

    func modelChanged() {
        createMissingPigNodes()

        pigNodes.forEach { $0.redraw() }

        cannonNode.redraw()
    }

    // MARK: - Private API

    private func setup() {
        addChild(cannonNode)

        model.add(observer: self)

        // Spawn automatically new enemies
        let spawnAction = SKAction.repeatForever(SKAction.sequence([
            SKAction.wait(forDuration: Constants.enemySpawnInterval),
            SKAction.run(spawnPig)
        ]))

        run(spawnAction)
    }

    private func spawnPig() {
        model.spawnPig()
    }

    // MARK: - Drawing mapping

    private func createMissingPigNodes() {
        let mappedModels = pigNodes.map { $0.model }
        let unMappedModels = model.pigs.filter { !mappedModels.contains($0) }
        let newNodes = unMappedModels.map(PigNode.init(model:))

        newNodes.forEach(addChild(_:))
        pigNodes.append(contentsOf: newNodes)
    }
}
