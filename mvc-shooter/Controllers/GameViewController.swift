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

class GameViewController: UIViewController {

    private let model: ScreenModelType
    private let canvasView: CanvasView
    private let controlsView: ControlsView

    init(model: ScreenModelType) {
        self.model = model
        self.canvasView = CanvasView(model: model)
        self.controlsView = ControlsView()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(canvasView)
        view.addSubview(controlsView)

        canvasView.frame = view.frame

        controlsView.translatesAutoresizingMaskIntoConstraints = false
        controlsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        controlsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true

        controlsView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        controlsView.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        controlsView.upButton.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        controlsView.downButton.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
    }

    // MARK: UI Callbacks

    @objc
    func leftButtonTapped() {
        model.moveCannonLeft()
    }

    @objc
    func rightButtonTapped() {
        model.moveCannonRight()
    }

    @objc
    func upButtonTapped() {
        model.moveCannonUp()
    }

    @objc
    func downButtonTapped() {
        model.moveCannonDown()
    }
}
