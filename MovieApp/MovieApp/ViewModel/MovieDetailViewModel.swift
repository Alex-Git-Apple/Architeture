//
//  MovieCellViewModel.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    @Published var likeButtonImage: String = ""
    let id: UUID
    let name: String
    let category: String
    var favorite: Bool {
        didSet {
            likeButtonImage = favorite ? "heart.fill" : "heart"
        }
    }
    
    var listener: FavoriteListener?
    
    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name
        self.category = movie.category
        self.favorite = movie.favorite
        self.likeButtonImage = favorite ? "heart.fill" : "heart"
    }
    
    func updateFavorite() {
        favorite.toggle()
        listener?.favoriteChange(on: name, with: favorite)
    }
    
}
