//
//  URLSessionHTTPClient.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    
    public let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    private enum HTTPMethod: String {
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    private enum Strings {
        static let contentType = "Content-Type"
        static let applicationJson = "application/json"
    }
    
    public func get(from url: URL) async throws -> HTTPClient.Result {
        let request = URLRequest(url: url)
        return try await task(request: request)
    }
    
    public func post(from url: URL, data: Data) async throws -> HTTPClient.Result {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue(Strings.applicationJson,
                         forHTTPHeaderField: Strings.contentType)
        request.httpBody = data
        return try await task(request: request)
    }
    
    public func put(from url: URL, data: Data) async throws -> HTTPClient.Result {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue(Strings.applicationJson,
                         forHTTPHeaderField: Strings.contentType)
        request.httpBody = data
        return try await task(request: request)
    }
    
    public func patch(from url: URL, data: Data) async throws -> HTTPClient.Result {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.patch.rawValue
        request.setValue(Strings.applicationJson,
                         forHTTPHeaderField: Strings.contentType)
        request.httpBody = data
        return try await task(request: request)
    }
    
    public func delete(from url: URL) async throws -> HTTPClient.Result {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.delete.rawValue
        request.setValue(Strings.applicationJson,
                         forHTTPHeaderField: Strings.contentType)
        return try await task(request: request)
    }
    
    private func task(request: URLRequest) async throws -> HTTPClient.Result {
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.requestFailed
        }
        
        guard httpResponse.statusCode == 200 else {
            throw APIError.unexpectedStatusCode
        }
        return .success((data, response as! HTTPURLResponse))
    }
}
