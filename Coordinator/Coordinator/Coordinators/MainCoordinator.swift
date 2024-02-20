//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Pin Lu on 2/17/24.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
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
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // The fromController is the view controller before the navigation starts. If it is still there,
        // the action is a push. Otherwise, it is a pop.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(fromViewController)
        else { return }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
    
}
