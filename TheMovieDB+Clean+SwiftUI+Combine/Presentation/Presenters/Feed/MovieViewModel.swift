//
//  MovieViewModel.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    let movie: Movie
    private let base = "https://image.tmdb.org/t/p/"
    private let imageLoader: ImageLoader
    @Published var imageData: Data?
    @Published var showDefaultImage: Bool = false
    
    init(movie: Movie, imageLoader: ImageLoader) {
        self.movie = movie
        self.imageLoader = imageLoader
    }
    
    enum PosterSize: String {
        case w92, w154, w185, w342, w500, w780, original
    }
    
    var imageUrl: URL? {
        guard let path = movie.posterPath,
              let url = URL(string: base + PosterSize.w342.rawValue + path) else {
            return nil
        }
        return url
    }
    
    func getImageData() async {
        guard let imageUrl = imageUrl else {
            showDefaultImage = true
            return
        }
        do {
            let imageData = try await imageLoader.load(url: imageUrl)
            DispatchQueue.main.async {
                self.imageData = imageData
            }
        } catch {
            print("error loading image", error.localizedDescription)
            showDefaultImage = true
        }
    }
}
