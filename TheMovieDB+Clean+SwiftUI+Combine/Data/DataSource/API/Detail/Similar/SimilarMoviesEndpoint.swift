//
//  SimilarMoviesEndpoint.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 12/08/22.
//

import Foundation

struct SimilarMoviesEndpoint: Endpoint {
    var path: String {
        "/3/movie/\(movieId)/similar"
    }

    let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
    }
}
