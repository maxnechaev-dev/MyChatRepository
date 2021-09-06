//
//  UIStackView + Extension.swift
//  MyChat
//
//  Created by Max Nechaev on 24.08.2021.
//

import UIKit

extension UIStackView {
    convenience init (arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
