//
//  ViewController.swift
//  Coordinator
//
//  Created by Pin Lu on 2/17/24.
//

import UIKit

class HomeViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    var buyButton: UIButton!
    var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpBuyButton()
        setUpCreatebutton()
    }
    
    func setUpBuyButton() {
        var config = UIButton.Configuration.filled()
        config.title = "Buy"
        buyButton = UIButton(configuration: config)
        buyButton.addTarget(self, action: #selector(buyTapped), for: .primaryActionTriggered)
        
        view.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setUpCreatebutton() {
        var config = UIButton.Configuration.filled()
        config.title = "Create"
        createButton = UIButton(configuration:config)
        
        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.addTarget(self, action: #selector(createTapped), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 100),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func buyTapped() {
        coordinator?.buySubscription()
    }
    
    @objc func createTapped() {
        coordinator?.createAccount()
    }

}

