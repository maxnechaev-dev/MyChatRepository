//
//  WaitingChatCell.swift
//  MyChat
//
//  Created by Max Nechaev on 26.08.2021.
//

import UIKit
import SDWebImage

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "WaitingChatCell"
    
    let friendImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        layer.cornerRadius = 4
        clipsToBounds = true
        setupConstraints()
    }
    
    func configure<U>(with value: U) {
        guard let chat: MChat = value as? MChat else { return }
        friendImageView.sd_setImage(with: URL(string: chat.friendAvatarStringURL), completed: nil)
    }
    
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)
        friendImageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            friendImageView.topAnchor.constraint(equalTo: topAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Swift UI
import SwiftUI

struct WaitingChatCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
