//
//  CreateAccountViewController.swift
//  Coordinator
//
//  Created by Pin Lu on 2/17/24.
//

import UIKit

class CreateAccountViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabel()
    }
    
    func setupLabel() {
        let label = UILabel(frame: .zero)
        label.text = "Creat Account"
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }

}
