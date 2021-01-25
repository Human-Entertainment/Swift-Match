import XCTest
@testable import Match

final class MatcherTests: XCTestCase {
    func testMatch() {
        let testCase = Match.match (2) {
            given (2, 3) {
                "Hello"
            }
            
            given (3) {
                "Interesting"
            }
            
            
        } fallback: {
            "Matched none"
        }
        
        XCTAssert(testCase == "Hello")
        
        let testOperator = Match.match (2) {
            [2, 3] => "Hello"
            
            
            (3) => "Interesting"
            
            
        } fallback: {
            "Matched none"
        }
        XCTAssert(testOperator == "Hello")
        
        let testExtension = 2.match {
            [2, 3] => {"Hello"}
            
            
            (3) => "interesting"
        } fallback: {
            "Matched none"
        }
        
        XCTAssert(testExtension == "Hello")
        
        let testNonautoclosure = 2.match {
            [2, 3] => {
                "Hello"
            }
        } fallback: {
            "Didn't match"
        }
        
        XCTAssert(testNonautoclosure == "Hello")
    }

    static var allTests = [
        ("testMatch", testMatch),
    ]
}
