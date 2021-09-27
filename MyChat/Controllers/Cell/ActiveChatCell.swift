//
//  ActiveChatCell.swift
//  MyChat
//
//  Created by Max Nechaev on 26.08.2021.
//

import UIKit
import SDWebImage

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
 
    static var reuseId: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "The last message", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.7872122526, green: 0.6269763112, blue: 0.9379726052, alpha: 1), endColor: #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
        layer.cornerRadius = 4
        clipsToBounds = true
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        friendName.text = chat.friendUsername
        lastMessage.text = chat.lastMessageContent
        friendImageView.sd_setImage(with: URL(string: chat.friendAvatarStringURL), completed: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActiveChatCell {
    
    private func setupConstraints() {
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        friendImageView.backgroundColor = .lightGray
        
        friendImageView.contentMode = .scaleAspectFill
        friendImageView.clipsToBounds = true
        
        addSubview(friendImageView)
        addSubview(friendName)
        addSubview(lastMessage)
        addSubview(gradientView)
                
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            friendImageView.widthAnchor.constraint(equalToConstant: 78),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
        ])
        
        NSLayoutConstraint.activate([
            friendName.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 12),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 12),
        ])
        
        NSLayoutConstraint.activate([
            lastMessage.topAnchor.constraint(equalTo: friendName.bottomAnchor, constant: 0),
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 12),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -12),
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: centerYAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 8),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
        ])
        

    }
}


//MARK: - Swift UI
import SwiftUI

struct ActiveChatCellProvider: PreviewProvider {
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
