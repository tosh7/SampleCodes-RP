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
    func minus(number: Int)
    func clear()
}

protocol HomeViewModelOutputs {
    var outputNumber: Driver<Int> { get }
    var outputNumberState: Driver<NumberState> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelType, HomeViewModelInputs, HomeViewModelOutputs {
    init(){
        let addObserver = addProperty
            .map { number in
                return number + 1
            }
        let minusObserver = minusProperty
            .map { number in
                return number - 1
            }
        let clearObserver = clearProperty
            .map { _ -> Int in
                return 0
            }
        outputNumber = Observable
            .merge(
                addObserver,
                minusObserver,
                clearObserver
            )
            .asDriverOnErrorJustComplete()
        outputNumberState = Observable
            .merge(
                addObserver,
                minusObserver,
                clearObserver
            )
            .map { number -> NumberState in
                if number >= 10 {
                    return .moreThanTen
                } else if number < 0 {
                    return .negative
                } else {
                    return .positive
                }
            }
            .asDriverOnErrorJustComplete()
    }
    
    
    private let addProperty = PublishSubject<Int>()
    func add(number: Int) {
        addProperty.onNext((number))
    }
    
    private let minusProperty = PublishSubject<Int>()
    func minus(number: Int) {
        minusProperty.onNext((number))
    }
    
    private let clearProperty = PublishSubject<Void>()
    func clear() {
        clearProperty.onNext(())
    }
    
    let outputNumber: Driver<Int>
    let outputNumberState: Driver<NumberState>
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
}
