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

class GameViewController: BaseGameViewController, BattleSceneDelegate {

    struct ShootingStates {
        static let singleShoot = SingleShootState(factory: Environment.current.objectsFactory)
        static let multiShoot = MultiShootState(factory: Environment.current.objectsFactory)
    }

    private let model: ScreenModelType
    private let controlsView: ControlsView
    private let battleSceen: BattleScene
    private let strategyControlsView: StateControlsView
    private let scoreLabel: UILabel

    // MARK: - Initializers

    init(model: ScreenModelType) {
        self.model = model
        self.controlsView = ControlsView()
        self.strategyControlsView = StateControlsView()
        self.scoreLabel = UILabel()
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

        // MARK: Score label

        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.textColor = .white
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])

        // MARK: StrategyControlsView

        view.addSubview(strategyControlsView)
        strategyControlsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            strategyControlsView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 15),
            strategyControlsView.trailingAnchor.constraint(equalTo: scoreLabel.trailingAnchor)
        ])

        // MARK: BattleScene & SKView

        battleSceen.battleSceneDelegate = self
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
        updateScoreLabel()
        initiateState()
    }

    // MARK: - BattleSceneDelegate

    func battleSceneShouldSpawnPig() {
        model.enqueue(command: CreatePigCommand(model: model))
    }

    func battleScene(shouldClear pigModel: PigModel) {
        model.enqueue(command: RemovePigCommand(model: model, pigModel: pigModel))
    }

    func battleScene(shouldClear birdModel: BirdModel) {
        model.enqueue(command: RemoveBirdCommand(model: model, birdModel: birdModel))
    }

    func battleScene(didChangeCannonDirection direction: Point) {
        model.enqueue(command: ShootCommand(model: model, direction: direction))
    }

    func battleSceneSpawnInterval() -> TimeInterval {
        return model.configuration.pigsSpawnFrequency
    }

    func battleSceneWillRender() {
        model.refresh()
    }

    func battleScene(collidate birdModel: BirdModel, with pigModel: PigModel) {
        model.enqueue(command: RemoveBirdCommand(model: model, birdModel: birdModel))
        model.enqueue(command: RemovePigCommand(model: model, pigModel: pigModel))

        ScoreManager.shared.incrementScore()
        updateScoreLabel()
    }

    // MARK: - UI Callbacks

    @objc
    func leftButtonTapped() {
        model.enqueue(command: MoveCommand(model: model, direction: .left))
    }

    @objc
    func rightButtonTapped() {
        model.enqueue(command: MoveCommand(model: model, direction: .right))
    }

    @objc
    func upButtonTapped() {
        model.enqueue(command: MoveCommand(model: model, direction: .up))
    }

    @objc
    func downButtonTapped() {
        model.enqueue(command: MoveCommand(model: model, direction: .down))
    }

    @objc
    func singleShootStrategyTapped() {
        model.enqueue(command: ChangeShootingState(model: model, shootingState: ShootingStates.singleShoot))
    }

    @objc
    func multiShootStrategyTapped() {
        model.enqueue(command: ChangeShootingState(model: model, shootingState: ShootingStates.multiShoot))
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

    private func updateScoreLabel() {
        scoreLabel.text = "Current score: \(ScoreManager.shared.current)"
    }

    private func initiateState() {
        (0..<5).forEach { _ in
            model.enqueue(command: CreatePigCommand(model: model))
        }
    }
}
