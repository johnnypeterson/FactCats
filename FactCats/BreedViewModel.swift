//
//  BreedViewModel.swift
//  FactCats
//
//  Created by Johnny Peterson on 1/9/21.
//

import SwiftUI
import Combine


class BreedViewModel: ObservableObject {
    @Published private(set) var state = State()
    private var subscriptions = Set<AnyCancellable>()
    
    
    func fetchNextPageIfPossible() {
         
        
        guard state.canLoadNextPage else {return}
        
        CatsAPI.getBreeds(page: state.page)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            state.canLoadNextPage = false
        }
    }
    
    private func onReceive(_ batch: [Breed]) {
        state.breeds += batch
        state.page += 1
        state.canLoadNextPage = batch.count == CatsAPI.limit
    }
    struct State {
        var breeds: [Breed] = []
        var page: Int = 1
        var canLoadNextPage = true
    }
}
