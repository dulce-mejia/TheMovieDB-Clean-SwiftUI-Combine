//
//  ContentView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 07/08/22.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel(feedLoader: RemoteFeedLoader(client: URLSessionHTTPClient(session: URLSession(configuration: .default))))
    var body: some View {
        NavigationView {
            Text("Hola Mundo!")
                .task {
                    await viewModel.loadFeed()
                }
        }
    }
}
