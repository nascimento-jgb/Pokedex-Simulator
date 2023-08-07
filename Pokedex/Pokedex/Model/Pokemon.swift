//
//  Pokemon.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import Foundation
import SwiftUI

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
    
    var backgroundColor: Color {
           return detectColor(pokemonType: type)
       }
    var pokedexId: String {
        return detectPokedexId(pokemonId: id)
       }
}

struct Evolution: Codable {
    let id: String
    let name: String
}

func detectColor(pokemonType: String) -> Color {
    switch pokemonType {
    case "poison": //Color(red: 0.6392156863, green: 0.2431372549, blue: 0.631372549)
        return .green
    case "fire":
        return Color(red: 0.9333333333, green: 0.5058823529, blue: 0.1882352941)
    case "electric":
        return Color(red: 0.968627451, green: 0.8156862745, blue: 0.1725490196)
    case "water":
        return Color(red: 0.3882352941, green: 0.5647058824, blue: 0.9411764706)
    case "flying":
        return Color(red: 0.662745098, green: 0.5607843137, blue: 0.9529411765)
    case "ghost":
        return Color(red: 0.4588235294, green: 0.3411764706, blue: 0.5921568627)
    case "dragon":
        return Color(red: 0.4352941176, green: 0.2078431373, blue: 0.9882352941)
    case "psychic":
        return Color(red: 0.9764705882, green: 0.3333333333, blue: 0.5294117647)
    case "ground":
        return Color(red: 0.8862745098, green: 0.7490196078, blue: 0.3960784314)
    case "fighting":
        return Color(red: 0.7607843137, green: 0.1803921569, blue: 0.1568627451)
    case "ice":
        return Color(red: 0.5882352941, green: 0.8509803922, blue: 0.8392156863)
    case "steel":
        return Color(red: 0.7176470588, green: 0.7176470588, blue: 0.8078431373)
    case "fairy":
        return Color(red: 0.8392156863, green: 0.5215686275, blue: 0.6784313725)
    case "normal":
        return Color(red: 0.6588235294, green: 0.6549019608, blue: 0.4784313725)
    case "bug":
        return Color(red: 0.6509803922, green: 0.7254901961, blue: 0.1019607843)
    case "grass":
        return Color(red: 0.4784313725, green: 0.9058823529, blue: 0.2980392157)
    case "rock":
        return Color(red: 0.7137254902, green: 0.631372549, blue: 0.2117647059)
    default:
        return .white
    }
}

func generateIcon(type :String) -> String {
    switch type {
    case "poison":
        return "drop.triangle"
    case "fire":
        return "flame"
    case "electric":
        return "bolt"
    case "water":
        return "circle.bottomthird.split"
    case "flying":
        return "wind"
    case "ghost":
        return "arkit"
    case "dragon":
        return "timelapse"
    case "psychic":
        return "eye"
    case "ground":
        return "circle.grid.hex"
    case "fighting":
        return "hand.raised"
    case "ice":
        return "snow"
    case "steel":
        return "gear"
    case "fairy":
        return "moon"
    case "normal":
        return "staroflife.fill"
    case "bug":
        return "ant"
    case "grass":
        return "leaf.arrow.circlepath"
    case "rock":
        return "cube.fill"
    default:
        return ""
    }
}

func detectPokedexId(pokemonId: Int) -> String {
    var newId: String = ""
    
    if pokemonId < 10 {
        newId = "#00" + "\(pokemonId)"
    } else if pokemonId < 100 && pokemonId > 9 {
        newId = "#0" + "\(pokemonId)"
    } else {
        newId = "#" + "\(pokemonId)"
    }
    return newId
}

let MOCK_POKEMON: [PokedexEntry] = [
    .init(attack: 50, defense: 32, description: "aaaaaaa", evolutionChain: [], height: 1, id: 1, imageUrl: "bulba", name: "bulbasaur", type: "poison", weight: 400),
    .init(attack: 120, defense: 250, description: "midterm", evolutionChain: [], height: 555, id: 2, imageUrl: "bulba", name: "Ivysaur", type: "poison", weight: 200),
    .init(attack: 600, defense: 500, description: "badass", evolutionChain: [], height: 777, id: 3, imageUrl: "bulba", name: "Venusaur", type: "poison", weight: 1000),
]
