//
//  UndoCommand.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 13/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class UndoCommand: Command {
    private let model: ScreenModelType

    init(model: ScreenModelType) {
        self.model = model
    }

    func execute() {
        guard let save = SaveGameManager.shared.load() else { return }

        model.load(from: save)
    }
}
