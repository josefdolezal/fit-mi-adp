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
    lazy var sceneRenderer = SceneRenderer(scene: self)

    // MARK: - Initializers

    init(model: ScreenModelType) {
        self.model = model

        super.init(size: .zero)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented, use init(model:) instead")
    }

    // MARK: - User interaction

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        model.spawnBird()
    }

    // MARK: - ScreenModelObserver

    func modelChanged() {
        model.cannon.accept(visitor: sceneRenderer)
        model.birds.forEach { $0.accept(visitor: sceneRenderer) }
        model.pigs.forEach { $0.accept(visitor: sceneRenderer) }
    }

    // MARK: - Private API

    private func setup() {
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
}
