import Foundation
import UIKit
import Combine

final class CombineCounterViewModel {

    init() {}

    // MARK - Outputs
    @Published private(set) var counter: Int = 0
    var labelColor: UIColor {
        if counter == 0 {
            return .black
        } else if counter > 0 {
            return .red
        } else {
            return .blue
        }
    }

    // MARK - Inputs
    func add() {
        counter += 1
    }

    func minus() {
        counter -= 1
    }

    func clear() {
        counter = 0
    }
}
