//
//  PigModel.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class PigModel: Equatable {

    private let pig: Pig

    init(pig: Pig) {
        self.pig = pig
    }

    // MARK: - Location API

    func locationX() -> Int {
        return pig.location.x
    }

    func locationY() -> Int {
        return pig.location.y
    }

    // MARK: - Equatable

    public static func ==(lhs: PigModel, rhs: PigModel) -> Bool {
        return lhs === rhs
    }
}
