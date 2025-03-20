//
//  Breed.swift
//  CatBreeds
//
//  Created by Roman Arriaga on 3/19/25.
//

import Foundation

struct Response: Decodable {
    let breeds: [Breed]
}

struct Breed: Decodable {
    let name: String
    let popularity: Int
    let knownFor: String
    let photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case popularity
        case knownFor = "known_for"
        case photoUrl = "photo_url"
    }
}
