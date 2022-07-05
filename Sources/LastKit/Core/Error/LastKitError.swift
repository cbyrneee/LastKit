//
//  LastKitError.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

public enum LastKitError : Error {
    case notAuthenticated
    case apiError(Int, String)
}
