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

final class HomeViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private let viewModel = HomeViewModel()
    private var number: Int = 0

    init() {
        super.init(nibName: nil, bundle: nil)

        setupViews()
        bindings()
    }

    required init?(coder: NSCoder) { fatalError() }

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        return button
    }()
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Minus", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(minus), for: .touchUpInside)
        return button
    }()
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clear", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(clear), for: .touchUpInside)
        return button
    }()

    @objc func add(_ sender: Any) {
        viewModel.inputs.add()
    }

    @objc func minus(_ sender: Any) {
        viewModel.inputs.minus()
    }

    @objc func clear(_ sender: Any) {
        viewModel.inputs.clear()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(addButton)
        view.addSubview(minusButton)
        view.addSubview(clearButton)

        label.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false

        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        addButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        minusButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 100).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        minusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        clearButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 100).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func bindings() {
        // Inputs
        addButton.rx.tap.subscribe(onDisposed: { [weak self] in
            self?.viewModel.inputs.add()
        }).disposed(by: disposeBag)


        // Outputs
//        viewModel.outputs.outputNumber.drive(onNext: { [weak self] number in
//            self?.label.text = String(number)
//            self?.number = number
//        }).disposed(by: disposeBag)
//
//        viewModel.outputs.outputNumberState.drive(onNext: { [weak self] state in
//            switch state {
//            case .positive:
//                self?.label.textColor = UIColor.black
//            case .moreThanTen:
//                self?.label.textColor = UIColor.red
//            case .negative:
//                self?.label.textColor = UIColor.blue
//            }
//        }).disposed(by: disposeBag)
    }
}
