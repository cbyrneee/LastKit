//
//  GetInfoResponse.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

struct GetInfoResponse : Codable {
    let user: UserInfo
}

public struct UserInfo : Codable {
    let country, age, playcount, subscriber, realname, playlists, bootstrap, url, gender, name, type: String
    
    public struct Image : Codable {
        let size: ImageSize
        let text: String
        
        enum ImageSize : Codable {
            case small, medium, large, extralarge
        }
        
        enum CodingKeys: String, CodingKey {
            case size
            case text = "#text"
        }
    }
}
