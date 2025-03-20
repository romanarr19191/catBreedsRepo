//
//  NetworkManager.swift
//  CatBreeds
//
//  Created by Roman Arriaga on 3/19/25.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
}
protocol NetworkService {
    func get(url: String)async throws -> Data
}

struct NetworkManager: NetworkService {
    private var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func get(url: String)async throws -> Data {
        guard let urlObj = URL(string: url) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await session.data(from: urlObj)
        
        // validate response latter
        return data
    }
}
