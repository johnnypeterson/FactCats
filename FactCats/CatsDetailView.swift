//
//  CatsDetailView.swift
//  FactCats
//
//  Created by Johnny Peterson on 1/9/21.
//

import SwiftUI

struct CatsDetailView: View {
    let breed:Breed
    
    var body: some View {
        
        VStack {
            Text("\(breed.breed)")
                .font(.title)
            Text("Pattern: \(breed.pattern)")
            Text("Coat: \(breed.coat)")
            Text("Origin: \(breed.origin)")
            Text("Country: \(breed.country)")
            
            
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
        .navigationBarTitle(Text(breed.breed), displayMode: .inline)
    }
    
}

struct CatsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatsDetailView(breed: Breed(breed: "Scottish Fold", country: "United Kingdom (Scotland)", origin: "Natural/Mutation", coat: "Short/Long", pattern: "All"))
    }
    
    
}
