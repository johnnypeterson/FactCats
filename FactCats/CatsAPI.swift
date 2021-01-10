//
//  CatsAPI.swift
//  FactCats
//
//  Created by Johnny Peterson on 1/9/21.
//

import Foundation
import Combine

enum CatsAPI {
    static let limit = 15
    
    
    static func getBreeds(page: Int) -> AnyPublisher<[Breed], Error> {
        let url = URL(string: "https://catfact.ninja/breeds?limit=\(Self.limit)&page=\(page)")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!) })
            .tryMap { try JSONDecoder().decode(BreedResults<Breed>.self, from: $0.data).data }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
