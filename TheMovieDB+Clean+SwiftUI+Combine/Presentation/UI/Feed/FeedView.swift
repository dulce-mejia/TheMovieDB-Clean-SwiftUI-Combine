//
//  ContentView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 07/08/22.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel
    let layout = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 10) {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        MovieView(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
            .task {
                await viewModel.loadFeed()
            }
        }
    }
}
