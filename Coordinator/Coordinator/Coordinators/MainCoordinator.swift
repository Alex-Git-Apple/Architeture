//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Pin Lu on 2/17/24.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var childRootVCToCoordinator: [UIViewController: Coordinator] = [:]
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
    
    func childDidFinish(_ child: UIViewController) {
        childRootVCToCoordinator[child] = nil
        print("Remove child coordinator")
    }
    
}

extension MainCoordinator: Buying, AccountCreating {
    
    func buySubscription(product: String) {
        let buyCoordinator = BuyCoordinator(navigationControlelr: navigationController)
        buyCoordinator.parentCoordinator = self
        buyCoordinator.product = product
        buyCoordinator.start()
        childRootVCToCoordinator[buyCoordinator.rootVC] = buyCoordinator
    }
    
    func createAccount() {
        let vc = CreateAccountViewController()
        vc.coordinator  = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // The fromController is the view controller before the navigation starts. If it is still there,
        // the action is a push. Otherwise, it is a pop.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(fromViewController)
        else { return }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController)
        }
    }
    
}
