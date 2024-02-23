//
//  MovieCellViewModel.swift
//  MovieApp
//
//  Created by Pin Lu on 2/22/24.
//

import Foundation

class MovieCellViewModel: ObservableObject {
    
    @Published var likeButtonImage: String = ""
    var name: String
    var favorite: Bool {
        didSet {
            likeButtonImage = favorite ? "heart.fill" : "heart"
        }
    }
    
    
    weak var listener: FavoriteListener?
    
    init(_ movie: Movie) {
        name = movie.name
        favorite = movie.favorite
        likeButtonImage = favorite ? "heart.fill" : "heart"
    }
    
    func toggleFavorite() {
        favorite.toggle()
        listener?.favoriteChange(on: name, with: favorite)
    }
}

protocol FavoriteListener: AnyObject {
    
    func favoriteChange(on name: String, with value: Bool)
}
