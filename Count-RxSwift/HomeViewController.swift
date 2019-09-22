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

final class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    let viewModel = HomeViewModel()
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.outputs.outputNumber.drive(onNext: {[weak self] number in
            self?.label.text = String(number)
            self?.number = number
        }).disposed(by: disposeBag)
    }
    
    @IBAction func add(_ sender: Any) {
        viewModel.inputs.add(number: number)
    }
    @IBAction func minus(_ sender: Any) {
        viewModel.inputs.minus(number: number)
    }
    @IBAction func clear(_ sender: Any) {
        viewModel.inputs.clear()
    }
}

