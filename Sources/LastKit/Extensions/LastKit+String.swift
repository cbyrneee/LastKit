//
//  LastKit+String.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation
import CryptoKit

extension String {
    func md5() -> String {
        return Insecure.MD5.hash(data: self.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}
