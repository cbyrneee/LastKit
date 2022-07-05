//
//  AuthenticationMethod.swift
//  LastKit
//
//  Created by Conor Byrne on 05/07/2022.
//

import Foundation

public enum AuthenticationMethod {
    /**
     * The `String` used here is the `token` received from the callback.
     */
    case web(String)
}
