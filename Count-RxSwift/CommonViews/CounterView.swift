import UIKit

final class CounterView: UIView {

    var addClosure: (() -> Void)?
    var minusClosure: (() -> Void)?
    var clearClosure: (() -> Void)?

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubview(label)
        addSubview(addButton)
        addSubview(minusButton)
        addSubview(clearButton)

        label.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false

        label.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        minusButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 100).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        minusButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        clearButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 100).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        clearButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
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
        addClosure?()
    }

    @objc func minus(_ sender: Any) {
        minusClosure?()
    }

    @objc func clear(_ sender: Any) {
        clearClosure?()
    }

    func setNumber(_ number: Int) {
        label.text = String(number)
    }

    func setLabelColor(_ color: UIColor) {
        label.textColor = color
    }
}
