//
//  MovieView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import SwiftUI

struct MovieView: View {
    @StateObject var viewModel: MovieViewModel
    
    init(movie: Movie, imageLoader: ImageLoader) {
        self._viewModel = StateObject(wrappedValue: MovieViewModel(movie: movie, imageLoader: imageLoader))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let data = viewModel.imageData {
                Image(uiImage: UIImage(data: data) ?? UIImage(named: "no-image")!)
                    .resizable()
            } else {
                if viewModel.showDefaultImage {
                    Image("no-image")
                        .resizable()
                } else {
                    ProgressView()
                }
            }
            Text(viewModel.movie.title ?? "")
                .font(.body)
                .multilineTextAlignment(.center)
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
        .onAppear{
            Task {
                await viewModel.getImageData()
            }
        }
    }
}
