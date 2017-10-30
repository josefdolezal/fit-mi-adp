//
//  BaseGameViewController.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 06/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class BaseGameViewController: UIViewController {

    var skView: SKView! { return view as! SKView }

    override func loadView() {
        self.view = SKView()
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
