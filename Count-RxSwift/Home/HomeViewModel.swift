import Foundation
import UIKit
import SwiftUI
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
    @Published private(set) var items: [SectionModel] = [
        .init(name: "UIKitUI * Combine", vc: CombineCounterViewController()),
        .init(name: "SwiftUI * Combine", vc: UIHostingController(rootView: CombineView()))
    ]

    // MARK - Inputs
    func selectItem(indexPath: IndexPath) {
        nextViewController = items[indexPath.item].vc
    }
}
