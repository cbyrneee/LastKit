import XCTest
@testable import LastKit

final class LastKitTests: XCTestCase {
    func testAuthentication() async throws {
        let credentials = APICredentials(key: "", secret: "")
        let lastFM = LastFM(credentials: credentials)
        
        try await lastFM.authenticate(method: .web("token"))
        print(try await lastFM.getAuthenticatedUser())
    }
}
