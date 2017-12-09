//
//  SceneRenderer.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation
import SpriteKit

class SceneRenderer: GameObjectVisitor {

    private weak var scene: BattleScene!

    private var cannonNode: CannonNode?
    private var pigNodes = [PigNode]()
    private var birdNodes = [BirdNode]()

    init(scene: BattleScene) {
        self.scene = scene
    }

    // MARK: - GameObjectVisitor

    func visit(object: CannonModel) {
        renderCannon(node: cannonNode(for: object))
    }

    func visit(object: PigModel) {
        renderPig(node: pigNode(for: object))
    }

    func visit(object: BirdModel) {
        renderBird(model: birdNode(for: object))
    }

    // MARK: - Render actions

    private func renderCannon(node: CannonNode) {
        node.redraw()
    }

    private func renderPig(node: PigNode) {
        // Custom actions only - handle by scene
    }

    private func renderBird(model: BirdNode) {
        // Custom actions only - handled by scene
    }

    // MARK: - Drawing & caching mapping

    private func pigNode(for model: PigModel) -> PigNode {
        // Return cached node if exists, create new otherwise
        guard let node = pigNodes.filter({ $0.model === model }).first else {
            let node = PigNode(model: model)

            pigNodes.append(node)
            scene.addChild(node)

            return node
        }

        return node
    }

    private func birdNode(for model: BirdModel) -> BirdNode {
        guard let node = birdNodes.filter({ $0.model === model }).first else {
            let node = BirdNode(model: model)

            birdNodes.append(node)
            scene.addChild(node)

            return node
        }

        return node
    }

    private func cannonNode(for model: CannonModel) -> CannonNode {
        guard let node = cannonNode else {
            let node = CannonNode(model: model)

            cannonNode = node
            scene.addChild(node)

            return node
        }

        return node
    }

    private func createMissingBirdNodes() {
//        let shootAction = SKAction.sequence([
//            SKAction.applyForce(.init(dx: 100, dy: 40), duration: 3),
//            SKAction.removeFromParent(),
//            ])
//
//        newNodes.enumerated().forEach { offset, node in
//            addChild(node)
//            node.run(SKAction.sequence([
//                SKAction.wait(forDuration: 0.3 * Double(offset)),
//                shootAction,
//                ]))
//        }
    }
}
