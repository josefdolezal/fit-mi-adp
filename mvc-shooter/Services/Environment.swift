//
//  Environment.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 11/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class Environment: Decodable {

    // MARK: - Coding API

    enum CodingKeys: String, CodingKey {
        case configuration = "Configuration"
    }

    static let current = Environment.load()

    // MARK: - Environment properties

    let configuration: String

    var shootingStrategy: ShootingStrategy {
        return configuration == "Simple" ? ThrowShootingStrategy() : BalisticShootingStrategy()
    }

}

extension Environment {
    private static func load() -> Environment {
        let plistDecoder = PropertyListDecoder()
        let data = try! Data(contentsOf: Bundle.main.url(forResource: "Info", withExtension: "plist")!)

        return try! plistDecoder.decode(Environment.self, from: data)
    }
}
