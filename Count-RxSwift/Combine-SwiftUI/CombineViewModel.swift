import Foundation
import UIKit

final class CombineViewModel: ObservableObject {

    struct SectionModel: Hashable {
        var name: String
        var vc: UIViewController

        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }

        static func == (lhs: CombineViewModel.SectionModel, rhs: CombineViewModel.SectionModel) -> Bool {
            lhs.name == rhs.name
        }
    }

    init() {}

    // MARK - Outputs
    @Published private(set) var items: [SectionModel] = []

    // MARK - Inputs
}
