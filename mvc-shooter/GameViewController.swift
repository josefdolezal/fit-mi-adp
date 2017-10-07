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

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene()

        scene.scaleMode = .aspectFill

        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
