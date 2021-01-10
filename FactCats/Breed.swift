//
//  Breed.swift
//  FactCats
//
//  Created by Johnny Peterson on 1/9/21.
//

import Foundation


struct Breed: Codable, Identifiable, Equatable {
    public var id: String {
        UUID().uuidString
    }
    public let breed: String
    public let country: String
    public let origin: String
    public let coat: String
    public let pattern: String
    
}

struct BreedResults<T: Codable>: Codable {
    let data: [T]
}
