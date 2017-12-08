//
//  ControlsView.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 31/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import UIKit

class ControlsView: UIView {

    let leftButton: UIButton
    let rightButton: UIButton
    let upButton: UIButton
    let downButton: UIButton

    override init(frame: CGRect) {
        self.leftButton = UIButton(type: .custom)
        self.rightButton = UIButton(type: .custom)
        self.upButton = UIButton(type: .custom)
        self.downButton = UIButton(type: .custom)

        leftButton.setImage(Asset.Controls.arrowLeft.image, for: .normal)
        rightButton.setImage(Asset.Controls.arrowRight.image, for: .normal)
        upButton.setImage(Asset.Controls.arrowTop.image, for: .normal)
        downButton.setImage(Asset.Controls.arrowBottom.image, for: .normal)

        super.init(frame: frame)

        [leftButton, rightButton, upButton, downButton].forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            addSubview(button)
        }

        let constraints = [
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            downButton.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 15),
            downButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            downButton.topAnchor.constraint(equalTo: upButton.bottomAnchor, constant: 15),
            upButton.topAnchor.constraint(equalTo: topAnchor),
            upButton.centerXAnchor.constraintEqualToSystemSpacingAfter(downButton.centerXAnchor, multiplier: 1),
            rightButton.leadingAnchor.constraint(equalTo: downButton.trailingAnchor, constant: 15),
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightButton.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
