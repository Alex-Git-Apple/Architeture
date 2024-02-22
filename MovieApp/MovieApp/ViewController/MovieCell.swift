//
//  MovieCell.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static let reusedID = "MovieCell"

    var nameLabel = UILabel(frame: .zero)
    var likeButton = UIButton()
    
    var viewModel: MovieCellViewModel!
    
    var stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        stackView.axis = .horizontal
        stackView.backgroundColor = .systemPink
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        setupNameLabel()
        setupLikeButton()
    }
    
    func setupNameLabel() {
        stackView.addArrangedSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 300),
            nameLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    
    func setupLikeButton() {
        var config = UIButton.Configuration.filled()
        config.title = "Like me"
        config.baseBackgroundColor = .orange
        likeButton = UIButton(configuration: config)
        likeButton.addTarget(self, action: #selector(buttonTap), for: .primaryActionTriggered)
        stackView.addArrangedSubview(likeButton)
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            likeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            likeButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            likeButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    
    func configure(_ cellViewModel: MovieCellViewModel) {
        viewModel = cellViewModel
        nameLabel.text = viewModel.name
        setLikeButtonImage()
    }
    
    func setLikeButtonImage() {
        likeButton.setImage(UIImage(systemName: viewModel.likeButtonImage), for: .normal)
    }
    
    
    @objc func buttonTap(_ sender: UIButton) {
        viewModel.toggleFavorite()
        sender.setImage(UIImage(systemName: viewModel.likeButtonImage), for: .normal)
    }
    
}
