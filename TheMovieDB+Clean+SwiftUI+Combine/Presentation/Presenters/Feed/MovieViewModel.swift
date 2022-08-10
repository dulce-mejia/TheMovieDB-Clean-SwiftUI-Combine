//
//  MovieViewModel.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import Foundation

final class MovieViewModel {
    let movie: Movie
    private let base = "https://image.tmdb.org/t/p/"
    private let posterSize: PosterSize
    
    init(movie: Movie, posterSize: PosterSize = .w342) {
        self.movie = movie
        self.posterSize = posterSize
    }
    
    enum PosterSize: String {
        case w92, w154, w185, w342, w500, w780, original
    }
    
    var imageUrl: URL? {
        guard let path = movie.posterPath,
              let url = URL(string: base + posterSize.rawValue + path) else {
            return nil
        }
        return url
    }
}
