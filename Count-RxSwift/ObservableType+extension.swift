//
//  ObservableType+extension.swift
//  Count-RxSwift
//
//  Created by Satoshi Komatsu on 2019/09/21.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import RxSwift
import RxCocoa

extension ObservableType {
    public func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            Observable.empty()
        }
    }
    
    public func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { _ in
            Driver.empty()
        }
    }
    
    public func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
    
    public func unwrap<T>() -> Observable<T> where E == T? {
        return filter { $0 != nil }.map { $0! }
    }
}

