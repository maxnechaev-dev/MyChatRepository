//
//  SectionHeader.swift
//  MyChat
//
//  Created by Max Nechaev on 27.08.2021.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(text: String, font: UIFont?, textColor: UIColor) {
        title.text = text
        title.font = font
        title.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
