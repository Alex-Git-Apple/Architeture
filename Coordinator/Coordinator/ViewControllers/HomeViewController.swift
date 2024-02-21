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
    let options = ["Option A", "Option B", "Option C"]
    var productIndex = 1
    var productControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupBuyButton()
        setupCreatebutton()
        setupProductControl()
    }
    
    func setupBuyButton() {
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
    
    func setupCreatebutton() {
        var config = UIButton.Configuration.filled()
        config.title = "Create"
        createButton = UIButton(configuration:config)
        
        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.addTarget(self, action: #selector(createAccountTapped), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 100),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupProductControl() {
        productControl = UISegmentedControl(items: options)
        productControl.selectedSegmentIndex = productIndex
        productControl.addTarget(self, action: #selector(selectProduct), for: .primaryActionTriggered)
        productControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(productControl)
        NSLayoutConstraint.activate([
            productControl.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 100),
            productControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func buyTapped() {
        coordinator?.buySubscription(product: options[productIndex])
    }
    
    @objc func createAccountTapped() {
        coordinator?.createAccount()
    }
    
    @objc func selectProduct(_ sender: UISegmentedControl) {
        productIndex = sender.selectedSegmentIndex
    }

}

