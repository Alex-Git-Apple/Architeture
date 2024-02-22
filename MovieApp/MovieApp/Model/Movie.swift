//
//  Movie.swift
//  MovieApp
//
//  Created by Pin Lu on 2/21/24.
//

import Foundation

struct Movie {
    let id: UUID
    let name: String
    let category: String
    var favorite: Bool
}

struct MockData {
    static let movie1 = Movie(id: UUID(), name: "Mr. & Mrs. Smith", category: "Action", favorite: false)
    static let movie2 = Movie(id: UUID(), name: "Argylle ", category: "Thriller", favorite: false)
    static let movie3 = Movie(id: UUID(), name: "How to Have Sex", category: "Drama", favorite: false)
}
