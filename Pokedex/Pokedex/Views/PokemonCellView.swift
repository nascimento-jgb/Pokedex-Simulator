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
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel()
    
    var body: some View{
        NavigationLink(destination: PokemonStatsView(pokemon: pokemon)) {
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
                .background(pokemon.backgroundColor)
                .cornerRadius(12)
                .shadow(color: pokemon.backgroundColor, radius: 6, x:0.0 , y: 0.0)
            }
        }
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
           let samplePokemon = PokedexEntry(
               attack: 100,
               defense: 80,
               description: "This is a sample Pokémon.",
               evolutionChain: [],
               height: 10,
               id: 152,
               imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2FA9167736-AF5D-4ED9-B732-4CC2A3D7AC72?alt=media&token=f0995687-12d5-4778-8add-567fff553691",
               name: "Samplemon",
               type: "fire",
               weight: 200
           )
           PokemonCellView(pokemon: samplePokemon)
    }
}
