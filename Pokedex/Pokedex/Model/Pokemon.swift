//
//  Pokemon.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import Foundation

struct PokedexEntry: Codable, Identifiable {
    let attack: Int
    let defense: Int
    let description: String
    let evolutionChain: [Evolution]?
    let height: Int
    let id: Int
    let imageUrl: String
    let name: String
    let type: String
    let weight: Int
}

struct Evolution: Codable {
    let id: String
    let name: String
}


let MOCK_POKEMON: [PokedexEntry] = [
    .init(attack: 50, defense: 32, description: "aaaaaaa", evolutionChain: [], height: 1, id: 1, imageUrl: "bulba", name: "bulbasaur", type: "poison", weight: 400),
    .init(attack: 120, defense: 250, description: "midterm", evolutionChain: [], height: 555, id: 2, imageUrl: "bulba", name: "Ivysaur", type: "poison", weight: 200),
    .init(attack: 600, defense: 500, description: "badass", evolutionChain: [], height: 777, id: 3, imageUrl: "bulba", name: "Venusaur", type: "poison", weight: 1000),
]
