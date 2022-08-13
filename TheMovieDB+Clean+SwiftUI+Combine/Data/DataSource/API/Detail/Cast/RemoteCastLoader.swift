//
//  RemoteCastLoader.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 12/08/22.
//

import Foundation

final class RemoteCastLoader: CastLoader {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load(movieId: Int) async throws -> [Cast] {
        let endpoint = CastEndpoint(movieId: movieId)
        
        guard let finalUrl = endpoint.urlComponents?.url else {
            throw APIError.badUrl
        }
        
        let resultRequest = try await client.get(from: finalUrl)
        
        guard let (data, _) = try? resultRequest.get() else {
            throw APIError.requestFailed
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let result = try? decoder.decode(CreditsDTO.self, from: data) else {
            throw APIError.decodingError
        }
        
        return result.cast.map { Cast(name: $0.name, profilePath: $0.profilePath) }
    }
}
