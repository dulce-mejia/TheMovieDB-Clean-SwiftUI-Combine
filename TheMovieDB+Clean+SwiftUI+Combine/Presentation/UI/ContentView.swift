//
//  ContentView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let client = makeHttpClient()
        let feedViewModel = FeedViewModel(feedLoader: RemoteFeedLoader(client: client))
        return FeedView(viewModel: feedViewModel, imageLoader: makeImageLoader(client: client))
    }
    
    private func makeHttpClient() -> HTTPClient {
        let urlSession = URLSession(configuration: .default)
        let client = URLSessionHTTPClient(session: urlSession)
        return client
    }
    
    private func makeImageLoader(client: HTTPClient) -> ImageLoader {
        let localCacheLoader = LocalImageCache()
        let imageLoader = RemoteImageLoader(client: client, cache: localCacheLoader)
        return imageLoader
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
