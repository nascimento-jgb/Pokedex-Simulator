//
//  PokemonCellModelView.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct PokemonCellView: View{
    let pokemon: PokedexEntry
    
    var body: some View{
        ZStack{
            VStack(alignment: .leading){
                Text(pokemon.name.capitalized)
                    .font(.headline).bold()
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.2))
                        )
                        .frame(width:100, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
            .background(detectColor(pokemonType: pokemon.type))
            .cornerRadius(12)
            .shadow(color: detectColor(pokemonType: pokemon.type), radius: 6, x:0.0 , y: 0.0)
        }
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
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView(pokemon: MOCK_POKEMON[2])
            
    }
}
