//
//  BattleScene.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 08/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import SpriteKit

class BattleScene: SKScene, ScreenModelObserver {

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
        cannonNode.redraw()
    }

    // MARK: - Private API

    private func setup() {
        addChild(cannonNode)

        model.add(observer: self)
    }
}
