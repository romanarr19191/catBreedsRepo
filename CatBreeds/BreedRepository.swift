//
//  BreedRepository.swift
//  CatBreeds
//
//  Created by Roman Arriaga on 3/19/25.
//

import Foundation


protocol BreedRepository {
    func getBreeds()async throws-> [Breed]
}

struct BreedRepositoryImpl: BreedRepository {
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }
    
    func getBreeds()async throws-> [Breed] {
        let data = try await networkService.get(url: EndPoint.baseUrl)
        return try JSONDecoder().decode(Response.self, from: data).breeds
    }
}
  
