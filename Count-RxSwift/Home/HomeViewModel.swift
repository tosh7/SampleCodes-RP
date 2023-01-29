import Foundation
import UIKit
import Combine

final class HomeViewModel {

    struct SectionModel: Hashable {
        var name: String
        var vc: UIViewController

        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }

        static func == (lhs: HomeViewModel.SectionModel, rhs: HomeViewModel.SectionModel) -> Bool {
            lhs.name == rhs.name
        }
    }

    init() {}

    // MARK - OutPuts
    @Published private(set) var nextViewController: UIViewController?
    @Published private(set) var items: [SectionModel] = []

    // MARK - Inputs
    func selectItem(indexPath: IndexPath) {
        nextViewController = CombineCounterViewController()
    }
}
