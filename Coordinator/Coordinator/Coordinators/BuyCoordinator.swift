//
//  BuyCoordinator.swift
//  Coordinator
//
//  Created by Pin Lu on 2/20/24.
//

import Foundation
import UIKit

class BuyCoordinator: Coordinator {
    var childCoordinators =  [Coordinator]()
    var rootVC: UIViewController!
    var navigationController: UINavigationController
    var product: String
    
    init(navigationControlelr: UINavigationController, product: String) {
        self.navigationController = navigationControlelr
        self.product = product
    }
    
    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        rootVC = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
}
