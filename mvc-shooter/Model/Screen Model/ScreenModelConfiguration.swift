//
//  ScreenModelConfiguration.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 09/12/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct ScreenModelConfiguration {
    var maximumPigsCount: Int
    var pigsSpawnFrequency: TimeInterval
    var objectsFactory: ObjectsFactory

    var sceneWidth: Int
    var sceneHeight: Int
}
