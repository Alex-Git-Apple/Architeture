//
//  MainTabBarController.swift
//  Coordinator
//
//  Created by Pin Lu on 2/20/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let mainCoordinator = MainCoordinator(navigationController: UINavigationController())
    let contactVC = ContactViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCoordinator.start()
        mainCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        contactVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        viewControllers = [mainCoordinator.navigationController, UINavigationController(rootViewController: contactVC)]
    }

}

class ContactViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        title = "Contacts"
    }
}
