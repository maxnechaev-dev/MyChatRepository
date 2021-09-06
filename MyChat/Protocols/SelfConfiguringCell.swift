//
//  SelfConfiguringCell.swift
//  MyChat
//
//  Created by Max Nechaev on 26.08.2021.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
