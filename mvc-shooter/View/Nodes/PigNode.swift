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

    let model: PigModel

    // MARK: - Initializers

    init(model: PigModel) {
        self.model = model
        let texture = SKTexture(imageNamed: NodeNames.piggyHappy)

        super.init(texture: texture, color: .clear, size: texture.size())

        self.position = .init(x: model.locationX(), y: model.locationY())

        setupNodePhysics(texture: texture)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented, use init(coder:)")
    }

    // MARK: - Public API

    func redraw() {
        run(SKAction.move(to: .init(x: model.locationX(), y: model.locationY()), duration: 0.1))
    }

    // MARK: - Private API

    private func setupNodePhysics(texture: SKTexture) {
        let physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width / 2)

        physicsBody.affectedByGravity = false
        physicsBody.isDynamic = false
        physicsBody.categoryBitMask = NodeCategory.pig.identifier
        physicsBody.contactTestBitMask = NodeCategory.bird.identifier

        self.physicsBody = physicsBody
    }
}
