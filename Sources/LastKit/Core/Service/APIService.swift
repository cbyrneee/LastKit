//
//  APIService.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

class APIService {
    private let credentials: APICredentials
    
    private let baseURL = "http://ws.audioscrobbler.com/2.0/"
    private let session = URLSession.shared
    
    init(credentials: APICredentials) {
        self.credentials = credentials
    }
    
    func get<T: Decodable>(
        method: String,
        parameters: [String:String] = [:],
        signed: Bool = false
    ) async throws -> T {
        let url = try makeRequestURL(method: method, parameters: parameters, signed: signed)
        let (data, _) = try await session.data(from: url)
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    private func makeRequestURL(
        method: String,
        parameters: [String:String] = [:],
        signed: Bool = false
    ) throws -> URL {
        guard var components = URLComponents(string: baseURL) else {
            throw APIServiceError.unknown
        }
        
        let items = parameters.map { URLQueryItem(name: $0, value: $1) }
        components.queryItems = try makeQueryItems(method: method, items: items, signed: signed)
        
        guard let url = components.url else {
            throw APIServiceError.unknown
        }
        
        return url
    }
    
    private func makeQueryItems(
        method: String,
        items: [URLQueryItem],
        signed: Bool = false
    ) throws -> [URLQueryItem] {
        var items = items
        items.append(URLQueryItem(name: "method", value: method))
        items.append(URLQueryItem(name: "format", value: "json"))
        items.append(URLQueryItem(name: "api_key", value: self.credentials.key))

        if (signed) {
            let signature = try generateSignature(items)
            items.append(URLQueryItem(name: "api_sig", value: signature))
        }
        
        return items
    }
    
    private func generateSignature(_ items: [URLQueryItem]) throws -> String {
        var signature: [String:String] = [
            "api_key": self.credentials.key
        ]
        
        try items.forEach { item in
            guard let value = item.value else {
                throw APIServiceError.unknown
            }
            
            if (item.name != "format") {
                signature[item.name] = value
            }
        }
        
        let stringSignature = signature
            .sorted { $0.0 < $1.0 }
            .compactMap { "\($0)\($1)" }
            .joined()
                        
        return (stringSignature + self.credentials.secret).md5()
    }
}
