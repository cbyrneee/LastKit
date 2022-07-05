//
//  LastFM.swift
//  LastKit
//
//  Created by Conor Byrne on 27/06/2022.
//

import Foundation

public final class LastFM {
    private let credentials: APICredentials
    private let authenticationService: AuthenticationService
    
    init(credentials: APICredentials) {
        self.credentials = credentials
        self.authenticationService = AuthenticationService(credentials: credentials)
    }
    
    init(apiKey: String, apiSecret: String) {
        self.credentials = APICredentials(key: apiKey, secret: apiSecret)
        self.authenticationService = AuthenticationService(credentials: self.credentials)
    }
    
    func authenticate(method: AuthenticationMethod) async throws {
        switch method {
        case .web(let token):
            let response = try await self.authenticationService.getSession(token: token)
            print(response)
        }
    }
}
