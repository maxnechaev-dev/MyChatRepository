//
//  UIImageView + Extension.swift
//  MyChat
//
//  Created by Max Nechaev on 24.08.2021.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
