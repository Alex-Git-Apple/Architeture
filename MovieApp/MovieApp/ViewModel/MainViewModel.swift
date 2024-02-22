//
//  MainViewModel.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//

import Foundation
import UIKit

class MainViewModel {
    
    var movieList = [Movie]()
    var cellDataSource = [MovieCellViewModel]()
    var indexPaths = [IndexPath]()
    
    func loadData() {
        movieList = [MockData.movie1, MockData.movie2, MockData.movie3]
        cellDataSource = movieList.map { MovieCellViewModel($0, self) }
    }
    
    func update(_ indexPath: IndexPath, _ favorite: Bool) {
        movieList[indexPath.row].favorite = favorite
        cellDataSource[indexPath.row].favorite = favorite
        indexPaths.append(indexPath)
    }
    
    func updateViewController(_ completion: @escaping ([IndexPath]) -> () ) {
        completion(indexPaths)
        indexPaths.removeAll()
    }
    
    func toogleFavorite(name: String) {
        for (index, movie) in movieList.enumerated() {
            if movie.name == name {
                movieList[index].favorite.toggle()
            }
        }
    }
}
