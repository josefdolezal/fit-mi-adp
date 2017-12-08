//
//  PigNode.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import SpriteKit

class PigNode: SKSpriteNode {

    private enum NodeNames {
        static let piggyHappy = "piggy-happy"
    }

    // MARK: - Initializers

    init(position: CGPoint) {
        let texture = SKTexture(imageNamed: NodeNames.piggyHappy)

        super.init(texture: texture, color: .clear, size: texture.size())

        setupNodePhysics(texture: texture)
    }

    required init?(coder aDecoder: NSCoder) {
        let texture = SKTexture(imageNamed: NodeNames.piggyHappy)

        super.init(coder: aDecoder)

        self.texture = texture
        setupNodePhysics(texture: texture)
    }

    // MARK: - Private API

    private func setupNodePhysics(texture: SKTexture) {
        let physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width / 2)

        physicsBody.affectedByGravity = false
        physicsBody.categoryBitMask = NodeCategory.pig.identifier
        physicsBody.collisionBitMask = NodeCategory.bird.identifier

        self.physicsBody = physicsBody
    }
}