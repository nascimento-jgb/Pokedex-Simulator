//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import Foundation

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
                        
                        for entry in validPokedexEntries {
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


//func getPokedexData() {
//    guard let url = URL(string: apiURLStirng) else {
//        print("Not possible to get the url from API.")
//        return
//    }
//
//    let request = URLRequest(url: url)
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error).")
//            } else if let data = data {
//                do {
//                    let jsonDecoder = JSONDecoder()
//                    // If your API data contains a `null` value in the beginning, use `[PokedexEntry?].self` to decode an array of optional PokedexEntry objects.
//                    let pokedexEntries = try jsonDecoder.decode([PokedexEntry?].self, from: data)
//                    // Filter out any `nil` entries (in case there are any).
//                    let validPokedexEntries = pokedexEntries.compactMap { $0 }
//
//                    for entry in validPokedexEntries {
//                        print("Name: \(entry.name)")
//                        print("Attack: \(entry.attack)")
//                        print("Defense: \(entry.defense)")
//                        // Add other properties as needed
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//    }
//    task.resume()
//}
