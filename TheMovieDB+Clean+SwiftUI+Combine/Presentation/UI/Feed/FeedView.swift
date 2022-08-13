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
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
            }
            .onAppear {
                Task {
                    await viewModel.loadFeedSequence()
                }
            }
            .navigationTitle("The MovieDB")
        }
    }
}
