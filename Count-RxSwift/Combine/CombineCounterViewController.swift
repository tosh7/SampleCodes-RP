import UIKit
import Combine
import SnapKit

final class CombineCounterViewController: UIViewController {

    private let viewModel = CombineCounterViewModel()
    private var cancellables: Set<AnyCancellable> = []

    init() {
        super.init(nibName: nil, bundle: nil)

        view.addSubview(counterView)

        counterView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        bindings()
    }

    required init?(coder: NSCoder) { fatalError() }

    private lazy var counterView: CounterView = {
        let view = CounterView()
        view.addClosure = { [weak self] in
            self?.viewModel.add()
        }
        view.minusClosure = { [weak self] in
            self?.viewModel.minus()
        }
        view.clearClosure = { [weak self] in
            self?.viewModel.clear()
        }
        return view
    }()

    private func bindings() {
        viewModel.$counter.sink { [weak self] counter in
            guard let self else { return }
            self.counterView.setNumber(counter)
        }.store(in: &cancellables)
    }
}
