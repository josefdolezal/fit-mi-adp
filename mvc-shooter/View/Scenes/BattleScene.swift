//
//  BattleScene.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import SpriteKit

class BattleScene: SKScene, ScreenModelObserver, SKPhysicsContactDelegate {

    private let model: ScreenModelType
    lazy var sceneRenderer = SceneRenderer(scene: self)

    // MARK: - Initializers

    init(model: ScreenModelType) {
        self.model = model

        super.init(size: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented, use init(model:) instead")
    }

    // MARK: Scene lifecycle

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        setup()
    }

    // MARK: - User interaction

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let location = touch.location(in: self)
        let point = Point(x: Int(location.x), y: Int(location.y))

        model.spawnBird(direction: point)
    }

    // MARK: - ScreenModelObserver

    func modelChanged() {
        model.cannon.accept(visitor: sceneRenderer)
        model.birds.forEach { $0.accept(visitor: sceneRenderer) }
        model.pigs.forEach { $0.accept(visitor: sceneRenderer) }
    }

    // MARK: - SKPhysicsContactDelegate

    func didBegin(_ contact: SKPhysicsContact) {
        if
            let bird = contact.bodyA.node as? BirdNode,
            let pig = contact.bodyB.node as? PigNode
        {
            makeCollision(between: bird, and: pig)
            return
        }

        if
            let pig = contact.bodyA.node as? PigNode,
            let bird = contact.bodyB.node as? BirdNode
        {
            makeCollision(between: bird, and: pig)
            return
        }

    }

    // MARK: - Private API

    private func setup() {
        physicsWorld.contactDelegate = self
        model.add(observer: self)

        // Spawn automatically new enemies
        let spawnAction = SKAction.repeatForever(SKAction.sequence([
            SKAction.wait(forDuration: model.configuration.pigsSpawnFrequency),
            SKAction.run(spawnPig)
        ]))

        run(spawnAction)
    }

    private func spawnPig() {
        model.spawnPig()
    }

    private func makeCollision(between bird: BirdNode, and pig: PigNode) {
        model.destroyPig(pig.model)
        model.destroyBird(bird.model)

        pig.removeFromParent()
        bird.removeFromParent()
    }
}
