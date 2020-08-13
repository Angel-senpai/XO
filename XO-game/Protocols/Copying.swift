//
//  Copying.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 8/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}
