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

    // MARK: - Initializers

    init(model: ScreenModelType) {
        self.model = model

        super.init(size: .zero)

        model.add(observer: self)
    }

    required init?(coder aDecoder: NSCoder) {
        guard let model = aDecoder.value(forKey: "model") as? ScreenModelType else {
            return nil
        }

        self.model = model
        super.init(coder: aDecoder)
    }

    // MARK: - ScreenModelObserver

    func modelChanged() {

    }
}
