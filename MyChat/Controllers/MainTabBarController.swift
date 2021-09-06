//
//  MainTabBarController.swift
//  MyChat
//
//  Created by Max Nechaev on 25.08.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        tabBar.tintColor = #colorLiteral(red: 0.5497069955, green: 0.3566839099, blue: 0.9665765166, alpha: 1)
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)
        
        viewControllers = [
            generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage!),
            generateNavigationController(rootViewController: listViewController, title: "Conversations", image: conversationImage!)]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
