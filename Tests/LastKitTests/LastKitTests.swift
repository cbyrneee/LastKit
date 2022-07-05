import XCTest
@testable import LastKit

final class LastKitTests: XCTestCase {
    func testInvalidAPICredentials() async throws {
        let credentials = APICredentials(key: " ", secret: " ")
        let lastFM = LastFM(credentials: credentials)
        
        // XCTAssertThrowsError doesn't support async/await yet
        do {
            try await lastFM.authenticate(method: .web("token"))
            XCTAssertTrue(false)
        } catch (let error) {
            switch error {
            case LastKitError.apiError(let code, let message):
                print("API error: \(message) (\(code))")
            default:
                print("Unknown error: \(error)")
            }
            
            XCTAssertTrue(true)
        }
    }
}
