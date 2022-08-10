//
//  MovieView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import SwiftUI

struct MovieView: View {
    let viewModel: MovieViewModel
    
    init(movie: Movie) {
        self.viewModel = MovieViewModel(movie: movie)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: viewModel.imageUrl) { image in
                image
                    .resizable()
            } placeholder: {
                ZStack {
                    ProgressView()
                    Image("no-image")
                        .resizable()
                        .frame(height: 175)
                        .aspectRatio(contentMode: .fit)
                }
            }
            Text(viewModel.movie.title ?? "")
                .font(.body)
                .multilineTextAlignment(.center)
                .bold()
                .padding(.bottom)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
        }
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
            .stroke(.black, lineWidth: 1)
        )
    }
}

struct MovieView_Previews: PreviewProvider {
    static let movie = Movie(id: 1,
                             backdropPath: nil,
                             voteCount: 3,
                             originalTitle: "Original",
                             posterPath: nil,
                             title: "Title",
                             voteAverage: 0.5,
                             releaseDate: "10/12/1998",
                             overview: "Overview")
    static var previews: some View {
        MovieView(movie: movie)
            .previewLayout(.sizeThatFits)
    }
}
