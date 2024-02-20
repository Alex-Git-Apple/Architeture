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
    var navigationController: UINavigationController
    
    init(navigationControlelr: UINavigationController) {
        self.navigationController = navigationControlelr
    }
    
    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
}
