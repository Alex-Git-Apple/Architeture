//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//
import Combine
import UIKit

class MovieDetailViewController: UIViewController {
    
    var nameLabel = UILabel(frame: .zero)
    var categtoryLabel = UILabel(frame: .zero)
    var likeButton = UIButton()
    var vm: MovieDetailViewModel
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    init(viewModel: MovieDetailViewModel) {
        self.vm = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        view.backgroundColor = .systemPink
        
        view.addSubview(nameLabel)
        view.addSubview(categtoryLabel)
        view.addSubview(likeButton)
        
        nameLabel.text = vm.name
        categtoryLabel.text = vm.category
        setupButton()
        setupBinding()
    }
    
    func setupButton() {
        var config = UIButton.Configuration.filled()
        config.title = "Like me"
        
        likeButton.configuration = config
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        categtoryLabel.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20
                                          ),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categtoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            categtoryLabel.heightAnchor.constraint(equalToConstant: 50),
            categtoryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: categtoryLabel.bottomAnchor, constant: 20),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupBinding() {
        vm.$likeButtonImage
            .sink { imageName in
                self.likeButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
            .store(in: &subscriptions)
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        vm.updateFavorite()
    }
}
