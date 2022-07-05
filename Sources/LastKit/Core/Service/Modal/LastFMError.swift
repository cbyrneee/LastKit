//
//  LastFMError.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

struct LastFMError : Codable {
    let code: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "error"
        case message
    }
}
