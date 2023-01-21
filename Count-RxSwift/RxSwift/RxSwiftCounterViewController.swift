//
//  HomeViewController.swift
//  Count-RxSwift
//
//  Created by Satoshi Komatsu on 2018/09/17.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum NumberState {
    case positive
    case moreThanTen
    case negative
}

final class RxSwiftCounterViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private let viewModel = HomeViewModel()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }
}
