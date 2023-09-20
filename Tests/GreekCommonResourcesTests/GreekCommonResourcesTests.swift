import XCTest
@testable import GreekCommonResources

final class GreekCommonResourcesTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        let englishString = "hello"
        let greekString = "Ωμεγα"
        let answer = englishString.containsGreek(isArchaic: true)
        let anotherAnswer = greekString.containsGreek(isArchaic: true)
        XCTAssertFalse(answer)
        XCTAssertTrue(anotherAnswer)
    }
}
