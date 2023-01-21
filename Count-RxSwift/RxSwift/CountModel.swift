//
//  CountModel.swift
//  Count-RxSwift
//
//  Created by Satoshi Komatsu on 2019/07/10.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation

final class CountModel {
    
    var number: Int
    
    init(number: Int = 0) {
        self.number = number
    }
    
    func add() -> Int {
        number += 1
        return number
    }
    
    func minus() -> Int {
        number -= 1
        return number
    }
    
    func clear() -> Int {
        number = 0
        return number
    }
}
