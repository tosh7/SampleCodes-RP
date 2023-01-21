import Foundation
import UIKit
import Combine

final class HomeViewModel {
    init() {}

    // MARK - OutPuts
    @Published private(set) var nextViewController: UIViewController?

    // MARK - Inputs
    func selectItem(indexPath: IndexPath) {
        nextViewController = CombineCounterViewController()
    }
}
