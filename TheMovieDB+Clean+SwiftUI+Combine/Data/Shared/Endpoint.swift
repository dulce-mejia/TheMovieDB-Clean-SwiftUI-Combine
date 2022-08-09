//
//  Endpoint.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

public protocol Endpoint {
    var path: String { get }
    var queryItems: [String: String] { get }
}
extension Endpoint {
    private var apiVersion: String {
        "/3"
    }
    
    private var base: String {
        "https://api.themoviedb.org"
    }
    
    private var apiKey: String {
        "api_key"
    }

    private var apiKeyValue: String {
        "f6cd5c1a9e6c6b965fdcab0fa6ddd38a"
    }
    
    public var queryItems: [String: String] {
        [:]
    }
    
    private var supportedLanguages: [String] {
        ["en", "es"]
    }
    
    private var languageAndRegion: [URLQueryItem] {
        let configDefault = ["language": "en", "region": "US"]
        guard let code = Locale.current.languageCode, let region = Locale.current.regionCode else {
            return configDefault.map { URLQueryItem(name: $0.key, value: $0.value)}
        }
        return ["language": code, "region": region].map { URLQueryItem(name: $0.key, value: $0.value)}
    }
    
    var urlComponents: URLComponents? {
        guard let components = URLComponents(string: base+apiVersion) else { return nil }
        var newComponents = components
        newComponents.path = path
        let apiKeyParameter = URLQueryItem(name: apiKey, value: apiKeyValue)
        let items: [URLQueryItem] =  queryItems.map { URLQueryItem(name: $0.key, value: $0.value)
        } + languageAndRegion + [apiKeyParameter]
        newComponents.queryItems = items
        return newComponents
    }
}
