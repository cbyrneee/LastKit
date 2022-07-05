//
//  GetSessionResponse.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

struct GetSessionResponse : Codable {
    let session: Session
    
    struct Session : Codable {
        let name: String
        let key: String
        let subscriber: Int
    }
}
