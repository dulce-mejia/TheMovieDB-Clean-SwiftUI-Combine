//
//  ContentView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 07/08/22.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.id) { movie in
                VStack {
                    Text(movie.title ?? "")
                    Text(movie.releaseDate ?? "")
                }
            }
            .task {
                await viewModel.loadFeed()
            }
        }
    }
}
