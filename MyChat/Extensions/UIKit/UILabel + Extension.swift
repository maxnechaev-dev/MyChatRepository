//
//  UILabel + Extension.swift
//  MyChat
//
//  Created by Max Nechaev on 24.08.2021.
//

import UIKit

extension UILabel {
    convenience init(text: String,
                     font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
