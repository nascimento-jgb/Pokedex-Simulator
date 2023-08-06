//
//  PokedexModelView.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import SwiftUI

struct PokedexView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    @State private var searchName = ""
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{

                TextField("Insert here a pokemon name", text: $searchName)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(viewModel.pokemon) { pokemon in
                        PokemonCellView(pokemon: pokemon)}
                    }
                }
            .navigationTitle("Pokedex - Gen 1")
            .padding(4)
            }
        }
    }

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
