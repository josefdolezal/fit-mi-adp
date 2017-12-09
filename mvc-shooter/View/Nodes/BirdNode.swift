//
//  BirdNode.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import SpriteKit

class BirdNode: SKSpriteNode {

    private static let nodeName = "bird"

    let model: BirdModel

    // MARK: - Initializers

    init(model: BirdModel) {
        let texture = SKTexture(imageNamed: BirdNode.nodeName)

        self.model = model

        super.init(texture: texture, color: .clear, size: texture.size())

        self.position = CGPoint(x: model.locationX(), y: model.locationY())
        setupNodePhysics(texture: texture)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented, use init(model:) instead")
    }

    // MARK: - Private API

    private func setupNodePhysics(texture: SKTexture) {
        let physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width / 2)

        physicsBody.affectedByGravity = true
        physicsBody.categoryBitMask = NodeCategory.bird.identifier
        physicsBody.contactTestBitMask = NodeCategory.pig.identifier

        self.physicsBody = physicsBody
    }
}
