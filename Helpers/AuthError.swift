//
//  AuthError.swift
//  MyChat
//
//  Created by Max Nechaev on 24.09.2021.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordsNotMatch
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        
        case .notFilled:
            return NSLocalizedString("Please fill all fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Invalid email address", comment: "")
        case .passwordsNotMatch:
            return NSLocalizedString("Passwords does not match", comment: "")
        case .unknownError:
            return NSLocalizedString("Something went wrong", comment: "")
        case .serverError:
            return NSLocalizedString("Sorry, server error", comment: "")
        }
    }
}
