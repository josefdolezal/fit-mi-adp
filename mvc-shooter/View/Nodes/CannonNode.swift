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

    // MARK: - Initializers

    init(position: CGPoint) {
        let texture = SKTexture(imageNamed: CannonNode.nodeName)

        super.init(texture: texture, color: .clear, size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        let texture = SKTexture(imageNamed: CannonNode.nodeName)

        super.init(coder: aDecoder)

        self.texture = texture
    }

    // MARK: - Private API
}
