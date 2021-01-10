//
//  CatsView.swift
//  FactCats
//
//  Created by Johnny Peterson on 1/9/21.
//

import SwiftUI
import Combine

struct CatsView: View {
    
    @ObservedObject var viewModel: BreedViewModel
    var body: some View {
        NavigationView {
            BreedList(breeds: viewModel.state.breeds, isLoading: viewModel.state.canLoadNextPage, onScrolledAtBottom: viewModel.fetchNextPageIfPossible)
                .navigationBarTitle(Text("Fact Cats"), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(
                                        destination: MetricsView(),
                                        label: {
                                            Text("Metrics")
                                        }))
                .onAppear(perform: viewModel.fetchNextPageIfPossible)
        }
    }
}
struct BreedList: View {
    let breeds: [Breed]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    var body: some View {
        
        List {
            
            breedList
            if isLoading {
                loadingIndicator
            }
        }
    }
    var breedList: some View {
        
        ForEach(breeds) { breed in
            
            NavigationLink(
                destination: CatsDetailView(breed: breed))  {
                CatsRow(breed: breed).onAppear {
                    if self.breeds.last == breed {
                        self.onScrolledAtBottom()
                    }
                }
            }
        }
        
    }
    private var loadingIndicator: some View {
        Spinner(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
    
}


struct CatsRow: View {
    let breed: Breed
    var catEmojies = ["😺", "😻", "😺", "😹", "😸", "😼", "🙀", "😿", "😾"]
    var body: some View {
        HStack {
            Text(breed.breed).font(.title)
            Text(verbatim: catEmojies.randomElement() ?? "😺")
            
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .top)
    }
    
}
