//
//  BreedViewModel.swift
//  CatBreeds
//
//  Created by Roman Arriaga on 3/19/25.
//

import Foundation

final class BreedViewModel {
    private let repository: BreedRepository
    private(set) var breeds: [Breed] = []
    weak var delegate: ViewControllerProtocol?
    init(repository: BreedRepository = BreedRepositoryImpl()) {
        self.repository = repository
    }
    
    @MainActor
    func fetchBreeds() {
        Task {
            do {
                self.breeds = try await repository.getBreeds()
                self.delegate?.refreshUI()
            } catch {
                print(error.localizedDescription)
                self.delegate?.showError()
            }
        }
    }
}
