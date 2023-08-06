//
//  PokedexModelView.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import SwiftUI

struct PokedexModelView: View {
    
    @State private var searchName = ""
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                //Rounded seraching field
                TextField("Insert here a pokemon name", text: $searchName)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(0..<151) { _ in
                        PokemonCell()}
                    }
                }
            .navigationTitle("Pokemon")
            .padding(4)
            }
        }
    }

struct PokedexModelView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexModelView()
    }
}
