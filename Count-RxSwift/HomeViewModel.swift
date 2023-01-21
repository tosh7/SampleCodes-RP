//
//  HomeViewModel.swift
//  Count-RxSwift
//
//  Created by Satoshi Komatsu on 2019/07/05.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelInputs {
    func add()
    func minus()
    func clear()
}

protocol HomeViewModelOutputs {
//    var outputNumber: Driver<Int> { get }
//    var outputNumberState: Driver<NumberState> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelType, HomeViewModelInputs, HomeViewModelOutputs {
    init(){
    }
    
    private var number: Int = 0

    func add() {
        number += 1
    }

    func minus() {
        number -= 1
    }

    func clear() {
        number = 0
    }
    
//    let outputNumber: Driver<Int>
//    let outputNumberState: Driver<NumberState>
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
}
