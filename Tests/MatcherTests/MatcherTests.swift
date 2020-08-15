import XCTest
@testable import Match

final class MatcherTests: XCTestCase {
    func testMatch() {
        let testCase = match (2) {
            given (2, 3) {
                "Hello"
            }
            
            given (3) {
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
