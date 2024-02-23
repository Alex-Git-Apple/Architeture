//
//  MainCoordinator.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let mainViewModel = MainViewModel()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let rootVC = ViewController(viewModel: mainViewModel)
        rootVC.coordinator = self
        navigationController.pushViewController(rootVC, animated: false)
    }
    
    func select(_ movie: Movie, indexPath: IndexPath) {
        let vm = MovieDetailViewModel(movie: movie, indexPath: indexPath)
        vm.listener = mainViewModel
        let vc = MovieDetailViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
}

