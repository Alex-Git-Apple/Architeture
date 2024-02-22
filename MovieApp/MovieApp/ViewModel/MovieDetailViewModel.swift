//
//  MovieCellViewModel.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//

import Foundation

class MovieDetailViewModel {
    
    let id: UUID
    let name: String
    let category: String
    var favorite: Bool
    var imageName: String  {
        favorite ? "heart.fill" : "heart"
    }
    let indexPath: IndexPath
    
    var coordinator: MainCoordinator?
    
    init(movie: Movie, indexPath: IndexPath) {
        self.id = movie.id
        self.name = movie.name
        self.category = movie.category
        self.favorite = movie.favorite
        self.indexPath = indexPath
    }
    
    func updateFavorite() {
        favorite.toggle()
        coordinator?.updateFavorite(favorite, indexPath: indexPath)
    }
    
}
