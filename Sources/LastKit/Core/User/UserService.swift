//
//  UserService.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

final class UserService : APIService {
    override init(credentials: APICredentials) {
        super.init(credentials: credentials)
    }
    
    func getInfo(user: String) async throws -> UserInfo {
        let response: GetInfoResponse = try await get(
            method: "user.getInfo",
            parameters: ["user": user],
            signed: false
        )
        
        return response.user
    }
}
