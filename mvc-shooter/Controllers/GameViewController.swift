//
//  GameViewController.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 05/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: BaseGameViewController {

    private let model: ScreenModelType
    private let scene: GameScene

    init(model: ScreenModelType) {
        self.model = model
        self.scene = GameScene()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        model.add(observer: scene)
        scene.scaleMode = .aspectFill

        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
    }
}
