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
    var indexPaths = [IndexPath]()
    
    func loadData() {
        movieList = [MockData.movie1, MockData.movie2, MockData.movie3]
    }
    
    func cellsDidChange(_ completion: @escaping ([IndexPath]) -> () ) {
        completion(indexPaths)
        indexPaths.removeAll()
    }
    
}

// Listen the favorite change
extension MainViewModel: FavoriteListener {
    
    func favoriteChange(on name: String, with value: Bool) {
        for (index, movie) in movieList.enumerated() {
            if movie.name == name {
                movieList[index].favorite = value
                indexPaths.append(IndexPath(row: index, section: 0))
            }
        }
    }
    
}
