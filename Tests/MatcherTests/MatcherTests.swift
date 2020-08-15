import XCTest
@testable import Match

final class MatcherTests: XCTestCase {
    func testMatch() {
        let testCase = match (2) {
            Case (2, 3) {
                "Hello"
            }
            
            Case (3) {
                "Interesting"
            }
        } ?? {
            "Matched none"
        }()
        
        XCTAssert(testCase == "Hello")
    }

    static var allTests = [
        ("testMatch", testMatch),
    ]
}
