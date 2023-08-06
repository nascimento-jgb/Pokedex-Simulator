//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [PokedexEntry]()
    let apiURLStirng: String = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        getPokedexData()
    }
    
    func getPokedexData() {
        
        guard let url = URL(string: apiURLStirng) else {
            print("Not possible to get the url from API.")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
            if let error = error {
                    print("Error: \(error).")
                } else if let data = data {
                    do {
                        let pokedexEntries = try JSONDecoder().decode([PokedexEntry?].self, from: data)
                        let validPokedexEntries = pokedexEntries.compactMap { $0 }
                        
                        for _ in validPokedexEntries {
                            DispatchQueue.main.async {
                                self.pokemon = validPokedexEntries
                            }
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
        }
        task.resume()
    }
}

