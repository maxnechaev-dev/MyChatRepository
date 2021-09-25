//
//  AuthNavigatingDelegate.swift
//  MyChat
//
//  Created by Max Nechaev on 24.09.2021.
//

import Foundation

protocol AuthNavigatingDelegate: class {
    func toLoginVC()
    func toSignUpVC()
}
