//
//  ContentView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 07/08/22.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel
    let imageLoader: ImageLoader
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.sections, id: \.section) { section in
                    FeedSectionView(viewModel: section,
                                    imageLoader: imageLoader)
                    Spacer(minLength: 4)
                }
            }
            .listStyle(.plain)
            .onAppear {
                Task {
                    do {
                        try await viewModel.loadFeedSequence()
                    }
                    catch {
                        print("error..", error.localizedDescription)
                    }
                }
            }
            .navigationTitle("The MovieDB")
        }
    }
}
