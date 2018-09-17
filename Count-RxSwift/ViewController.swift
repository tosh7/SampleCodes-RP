//
//  ViewController.swift
//  Count-RxSwift
//
//  Created by Satoshi Komatsu on 2018/09/17.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.rx.tap
            .subscribe(onNext: {
                self.number += 1
                self.label.text = String(self.number)
            })
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .subscribe(onNext: {
                self.number -= 1
                self.label.text = String(self.number)
            })
            .disposed(by: disposeBag)
        
        clearButton.rx.tap
            .subscribe(onNext: {
                self.number = 0
                self.label.text = String(self.number)
            })
            .disposed(by: disposeBag)
    }
}

