//
//  AuthenticationService.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

final class AuthenticationService : APIService {
    override init(credentials: APICredentials) {
        super.init(credentials: credentials)
    }
    
    func getSession(token: String) async throws -> GetSessionResponse {
        try await self.get(method: "auth.getSession", parameters: ["token": token], signed: true)
    }
}
