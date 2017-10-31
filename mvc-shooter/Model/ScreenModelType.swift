//
//  ScreenModelType.swift
//  mvc-shooter
//
//  Created by Josef Dolezal on 30/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

protocol ScreenModelType: class {
    var cannon: CannonModel { get }

    // MARK: - Cannon API

    func moveCannonLeft()

    func moveCannonRight()

    func moveCannonUp()
    
    func moveCannonDown()

    // MARK: - Observable API

    func add(observer: ScreenModelObserver)

    func remove(observer: ScreenModelObserver)
}
