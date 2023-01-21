import Foundation
import UIKit
import Combine

final class CombineCounterViewModel {

    private var cancellables: Set<AnyCancellable> = []

    // MARK - Outputs
    @Published private(set) var counter: Int = 0
    var labelColor: some Publisher<UIColor, Never> {
        $counter.map {
            if $0 == 0 {
                return .black
            } else if $0 > 0 {
                return .red
            } else {
                return .blue
            }
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
