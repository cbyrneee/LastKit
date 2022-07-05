import XCTest
@testable import LastKit

final class LastKitTests: XCTestCase {
    func testAuthentication() async throws {
        let lastFM = LastFM(
            apiKey: "key",
            apiSecret: "secret"
        )
        
        try await lastFM.authenticate(method: .web("token"))
    }
}
