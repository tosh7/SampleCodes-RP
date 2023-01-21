import XCTest
import UIKit
@testable import Count_RxSwift

final class CombineCounterViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_addtion() throws {
        let viewModel = CombineCounterViewModel()
        viewModel.add()
        viewModel.add()

        XCTAssertEqual(viewModel.counter, 2)
    }

    func test_deduction() throws {
        let viewModel = CombineCounterViewModel()
        viewModel.minus()
        viewModel.minus()

        XCTAssertEqual(viewModel.counter, -2)
    }

    func test_setClear() throws {
        let viewModel = CombineCounterViewModel()
        viewModel.add()
        viewModel.add()
        viewModel.minus()
        viewModel.add()
        viewModel.clear()

        XCTAssertEqual(viewModel.counter, 0)
    }

}
