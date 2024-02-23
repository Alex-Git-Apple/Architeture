//
//  ViewController.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    var viewModel: MainViewModel
    var coordinator: MainCoordinator?
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        viewModel = MainViewModel()
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.cellsDidChange { indexPaths in
            self.tableView.reloadRows(at: indexPaths, with: .fade)
        }
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reusedID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func loadData() {
        viewModel.loadData()
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reusedID, for: indexPath) as! MovieCell
        let movie = viewModel.movieList[indexPath.row]
        let cellViewModel = MovieCellViewModel(movie)
//        cellViewModel.listener = viewModel
        cellViewModel.favoriteOnChange = {(name, favorite) in
            self.viewModel.favoriteChange(on: name, with: favorite)
        }
        cell.configure(cellViewModel)
        return cell
    }
        
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movieList[indexPath.row]
        coordinator?.select(movie, indexPath: indexPath)
    }
}
