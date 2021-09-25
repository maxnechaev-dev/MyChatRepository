//
//  UserError.swift
//  MyChat
//
//  Created by Max Nechaev on 24.09.2021.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case canNotGetUserInfo
    case canNotUnwrapToMUser
}

extension UserError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        
        case .notFilled:
            return NSLocalizedString("Please fill all fields", comment: "")
        case .photoNotExist:
            return NSLocalizedString("User did not select photo", comment: "")
        case .canNotGetUserInfo:
            return NSLocalizedString("Can not load onfo about user", comment: "")
        case .canNotUnwrapToMUser:
            return NSLocalizedString("Can not convert user in MUser", comment: "")
        }
    }
}
