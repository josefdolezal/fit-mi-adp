//
//  CannonNode.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import SpriteKit

class CannonNode: SKSpriteNode {

    private static let nodeName = "cannon"

    let model: CannonModel

    // MARK: - Initializers

    init(model: CannonModel) {
        let texture = SKTexture(imageNamed: CannonNode.nodeName)

        self.model = model

        super.init(texture: texture, color: .clear, size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented, use init(model:) instead")
    }

    // MARK: - Public API

    func redraw() {
        let newLocation = CGPoint(x: model.locationX(), y: model.locationY())

        run(SKAction.move(to: newLocation, duration: 0.1))
    }

    // MARK: - Private API
}
