//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Pin Lu on 2/17/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription() {
        let buyCoordinator = BuyCoordinator(navigationControlelr: navigationController)
        buyCoordinator.parentCoordinator = self
        childCoordinators.append(buyCoordinator)
        buyCoordinator.start()
    }
    
    func createAccount() {
        let vc = CreateAccountViewController()
        vc.coordinator  = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
