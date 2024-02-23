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
    weak var listener: FavoriteListener?
    
    init(_ movie: Movie) {
        name = movie.name
        favorite = movie.favorite
    }
    
    func toggleFavorite() {
        favorite.toggle()
        listener?.favoriteChange(on: name, with: favorite)
        favoriteOnChange?(name, favorite)
    }
    
    var favoriteOnChange: ((String, Bool) -> ())?
}

protocol FavoriteListener: AnyObject {
    
    func favoriteChange(on name: String, with value: Bool)
}
