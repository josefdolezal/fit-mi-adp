//
//  SaveGameManager.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 12/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class SaveGameManager {
    static let shared = SaveGameManager()
    private var saves = [Any]()

    // MARK: - Initializers

    private init() {}

    // MARK: - Public API

    public func save(data: Any) {
        saves.append(data)
    }

    public func load() -> Any? {
        return saves.popLast()
    }
}
