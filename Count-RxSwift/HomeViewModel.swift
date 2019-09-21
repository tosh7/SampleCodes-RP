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
    func add(number: Int)
}

protocol HomeViewModelOutputs {
    var outputNumber: Driver<Int> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelType, HomeViewModelInputs, HomeViewModelOutputs {
    init(){
        outputNumber = addProperty
            .map { number in
                return number + 1
            }
            .asDriverOnErrorJustComplete()
    }

    
    private let addProperty = PublishSubject<Int>()
    func add(number: Int) {
        addProperty.onNext((number))
    }
    
    let outputNumber: Driver<Int>
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
}
