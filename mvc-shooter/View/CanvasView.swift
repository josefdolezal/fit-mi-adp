//
//  CanvasView.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 31/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import UIKit

class CanvasView: UIView, ScreenModelObserver {

    private let model: ScreenModelType
    private let drawer: ObjectsDrawer

    // MARK: Initializers

    init(model: ScreenModelType) {
        self.model = model
        self.drawer = ObjectsDrawer()

        super.init(frame: .zero)

        backgroundColor = UIColor(red: 0.9490, green: 0.9490, blue: 0.9490, alpha: 1.0)
        model.add(observer: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Drawing

    override func draw(_ rect: CGRect) {
        drawer.drawCannon(cannon: model.cannon)
    }

    // MARK: Screen Model Observer

    func modelChanged() {
        setNeedsDisplay()
    }
}
