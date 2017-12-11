//
//  ScoreManager.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 11/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class ScoreManager {

    static let shared = ScoreManager()

    private(set) var current = 0

    // MARK: - Initializers

    private init() { }

    // MARK: - Public API

    func setScore(newScore: Int) {
        current = newScore
    }

    func incrementScore() {
        current += 1
    }
}
