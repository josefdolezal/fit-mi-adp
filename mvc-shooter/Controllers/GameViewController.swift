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
    private let controlsView: ControlsView
    private let battleSceen: BattleScene

    // MARK: - Initializers

    init(model: ScreenModelType) {
        self.model = model
        self.controlsView = ControlsView()
        self.battleSceen = BattleScene(model: model)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Controller lifecycle

    override func loadView() {
        super.loadView()

        // MARK: ControlsView

        view.addSubview(controlsView)
        controlsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controlsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            controlsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])

        // MARK: SpriteKit Scene

        skView.contentMode = .scaleAspectFill
        skView.presentScene(battleSceen)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layoutIfNeeded()

        battleSceen.size = skView.bounds.size
        bindControls()
    }

    // MARK: - UI Callbacks

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

    // MARK: - Private API

    private func bindControls() {
        controlsView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        controlsView.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        controlsView.upButton.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        controlsView.downButton.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
    }
}
