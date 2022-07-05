//
//  LastFM.swift
//  LastKit
//
//  Created by Conor Byrne on 27/06/2022.
//

import Foundation

public final class LastFM {
    private let apiCredentials: APICredentials
    private let authenticationService: AuthenticationService
    
    private var userCredentials: UserCredentials? = nil
    
    init(credentials: APICredentials) {
        self.apiCredentials = credentials
        self.authenticationService = AuthenticationService(credentials: credentials)
    }
    
    func authenticate(method: AuthenticationMethod) async throws {
        switch method {
        case .web(let token):
            let response = try await self.authenticationService.getSession(token: token)
            self.userCredentials = response.session
        }
    }
}
