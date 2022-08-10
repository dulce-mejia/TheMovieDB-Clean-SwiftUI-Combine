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
        List {
            ForEach(viewModel.sections, id: \.section) { section in
                FeedSectionView(viewModel: section)
            }
        }
        .listStyle(.plain)
        .task {
            await viewModel.loadFeed()
        }
    }
}
