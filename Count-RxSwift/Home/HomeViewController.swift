import UIKit
import Combine

final class HomeViewController: UIViewController {

    enum Section {
        case main
    }

    private let viewModel = HomeViewModel()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    private var collectionView: UICollectionView! = nil
    private var cancellables: Set<AnyCancellable> = []

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white

        configureHieraechy()
        configureDataSource()
        bindling()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func bindling() {
        viewModel.$nextViewController.sink { [weak self] vc in
            guard let self, let vc else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }.store(in: &cancellables)
    }
}

extension HomeViewController {
    private func createView() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

extension HomeViewController {
    private func configureHieraechy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createView())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
    }

    private func configureDataSource() {
        let celRRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { [weak self] (cell, indexPath, item) in
            guard let self else { return }
            var content = cell.defaultContentConfiguration()
            content.text = self.viewModel.items[indexPath.item].name
            cell.contentConfiguration = content
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: celRRegistration, for: indexPath, item: identifier)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<2))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    //cellタップ時に呼ばれるメソッドここは今までと変わらず
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectItem(indexPath: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
