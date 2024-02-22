//
//  MovieCellViewModel.swift
//  MovieApp
//
//  Created by Pin Lu on 2/22/24.
//

import Foundation

class MovieCellViewModel {
    
    var name: String
    var favorite: Bool
    var likeButtonImage: String {
        favorite ? "heart.fill" : "heart"
    }
    weak var mainVM: MainViewModel?
    
    init(_ movie: Movie, _ mainVM: MainViewModel) {
        name = movie.name
        favorite = movie.favorite
        self.mainVM = mainVM
    }
    
    func toggleFavorite() {
        favorite.toggle()
        mainVM?.toogleFavorite(name: name)
    }
}
