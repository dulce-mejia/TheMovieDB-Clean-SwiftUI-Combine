//
//  ContentView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let feedViewModel = FeedViewModel(feedLoader: RemoteFeedLoader(client: makeHttpClient()))
        return FeedView(viewModel: feedViewModel)
    }
    
    private func makeHttpClient() -> HTTPClient {
        let urlSession = URLSession(configuration: .default)
        let client = URLSessionHTTPClient(session: urlSession)
        return client
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
