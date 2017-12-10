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

    struct ShootingStates {
        static let singleShoot = SingleShootState()
        static let multiShoot = MultiShootState()
    }

    private let model: ScreenModelType
    private let controlsView: ControlsView
    private let battleSceen: BattleScene
    private let strategyControlsView: StateControlsView

    // MARK: - Initializers

    init(model: ScreenModelType) {
        self.model = model
        self.controlsView = ControlsView()
        self.strategyControlsView = StateControlsView()
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

        // MARK: StrategyControlsView

        view.addSubview(strategyControlsView)
        strategyControlsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            strategyControlsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            strategyControlsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])

        // MARK: BattleScene & SKView

        skView.showsNodeCount = true
        skView.showsFPS = true
        skView.contentMode = .scaleAspectFill
        skView.presentScene(battleSceen)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layoutIfNeeded()

        battleSceen.size = skView.bounds.size
        model.configuration.sceneHeight = Int(battleSceen.size.height)
        model.configuration.sceneWidth = Int(battleSceen.size.width)

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

    @objc
    func singleShootStrategyTapped() {
        model.useShootingState(ShootingStates.singleShoot)
    }

    @objc
    func multiShootStrategyTapped() {
        model.useShootingState(ShootingStates.multiShoot)
    }

    // MARK: - Private API

    private func bindControls() {
        controlsView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        controlsView.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        controlsView.upButton.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        controlsView.downButton.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)

        strategyControlsView.singleShootButton.addTarget(self, action: #selector(singleShootStrategyTapped), for: .touchUpInside)
        strategyControlsView.multiShootButton.addTarget(self, action: #selector(multiShootStrategyTapped), for: .touchUpInside)
    }
}
