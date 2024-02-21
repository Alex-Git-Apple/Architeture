//
//  BuyCoordinator.swift
//  Coordinator
//
//  Created by Pin Lu on 2/20/24.
//

import Foundation
import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators =  [Coordinator]()
    var rootVC: UIViewController!
    var navigationController: UINavigationController
    var product: String?
    
    init(navigationControlelr: UINavigationController) {
        self.navigationController = navigationControlelr
    }
    
    func start() {
        let vc = BuyViewController()
        if let product = product {
            vc.product = product
        }
        vc.coordinator = self
        rootVC = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func didFinishBuying() {
//        parentCoordinator?.childDidFinish(self)
//    }
}
