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
}

protocol HomeViewModelOutputs {
    var number: Driver<Int> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelType, HomeViewModelInputs, HomeViewModelOutputs {
    var inputs: HomeViewModelInputs
    
    var outputs: HomeViewModelOutputs
    
    private let addProperty = PublishSubject<Void>()
    func add() {
        addProperty.onNext(())
    }
    
    var number: Driver<Int>
    
    init(){
        
    }
}
