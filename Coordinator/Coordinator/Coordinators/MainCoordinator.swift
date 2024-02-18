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
        let vc = BuyViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController()
        vc.coordinator  = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
