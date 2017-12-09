//
//  StrategyControlsView.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import UIKit

class StrategyControlsView: UIView {

    let multiShootButton: UIButton
    let singleShootButton: UIButton

    // MARK: - Initializers

    override init(frame: CGRect) {
        self.multiShootButton = StrategyControlsView.shootButton(asset: Asset.Controls.multiShootStrategy)
        self.singleShootButton = StrategyControlsView.shootButton(asset: Asset.Controls.singleShootStrategy)

        super.init(frame: frame)

        addSubview(multiShootButton)
        addSubview(singleShootButton)

        NSLayoutConstraint.activate([
            singleShootButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            singleShootButton.topAnchor.constraint(equalTo: self.topAnchor),
            singleShootButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            multiShootButton.leadingAnchor.constraint(equalTo: singleShootButton.trailingAnchor, constant: 10),
            multiShootButton.centerYAnchor.constraint(equalTo: singleShootButton.centerYAnchor),
            multiShootButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private API

    private static func shootButton(asset: ImageAsset) -> UIButton {
        let button = UIButton()

        button.setImage(asset.image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])

        return button
    }

}
