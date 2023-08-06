//
//  PokemonStatsView.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import SwiftUI
import Kingfisher

struct PokemonStatsView: View {
    let pokemon: PokedexEntry
    
    var body: some View {
        ZStack{
            
            VStack{
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 175)
                    .padding([.bottom, .trailing], 4)
                
                VStack{
                    Text(pokemon.name.capitalized + " " + pokemon.pokedexId)
                        .font(.headline).bold()
                        .foregroundColor(.black)
                        .padding(.top, 4)
                        .padding()
                    
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(pokemon.backgroundColor.opacity(0.5))
                        )
                        .frame(width:100, height: 24)
                    
                    //description needs to be formatted, bad input
                    Text(pokemon.description.capitalized)
                        .font(.subheadline).bold()
                        .foregroundColor(.black)
                        .padding(.top, 4)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    VStack{
                        
                        HStack{
                            Text("Attack")
                                .font(.subheadline).bold()
                                .foregroundColor(.black)
                                .padding(1)
                                .multilineTextAlignment(.center)
                            
                            Text("\(pokemon.attack)")
                            
                        }
                        .frame(width: 250, height: 25)
                        
                        HStack{
                            Text("Defense")
                                .font(.subheadline).bold()
                                .foregroundColor(.black)
                                .padding(1)
                                .multilineTextAlignment(.center)
                            
                            Text("\(pokemon.defense)")
                        }
                        
                        HStack{
                            Text("Height")
                                .font(.subheadline).bold()
                                .foregroundColor(.black)
                                .padding(1)
                                .multilineTextAlignment(.center)
                            
                            Text("\(pokemon.height) ft")
                        }
                        
                        HStack{
                            Text("Weight")
                                .font(.subheadline).bold()
                                .foregroundColor(.black)
                                .padding(1)
                                .multilineTextAlignment(.center)
                            
                            Text("\(pokemon.weight) oz")
                        }
                    }
                    .padding(.bottom, 15)
                        
                }.background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.95)))
            }
            
        }
        .background(pokemon.backgroundColor)
        .cornerRadius(12)
        .shadow(color: pokemon.backgroundColor, radius: 6, x:0.0 , y: 0.0)
        
    }
}

struct PokemonStatsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let samplePokemon = PokedexEntry(
                    attack: 100,
                    defense: 80,
                    description: "The infant rarely ventures out of its mother's protective pouch until it is 3 years old.",
                    evolutionChain: nil,
                    height: 10,
                    id: 1,
                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2FA9167736-AF5D-4ED9-B732-4CC2A3D7AC72?alt=media&token=f0995687-12d5-4778-8add-567fff553691",
                    name: "Tangela",
                    type: "grass",
                    weight: 200
            )
        
        PokemonStatsView(pokemon: samplePokemon)
    }
}
