//
//  BuyViewController.swift
//  Coordinator
//
//  Created by Pin Lu on 2/17/24.
//

import UIKit

class BuyViewController: UIViewController {
    weak var coordinator: BuyCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabel()
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        coordinator?.didFinishBuying()
//    }
    
    func setupLabel() {
        let label = UILabel(frame: .zero)
        label.text = "Buy"
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }

}
