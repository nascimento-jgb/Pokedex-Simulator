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
    
    @State private var isMenuOpen = false
    @State private var selectedType: String = ""
    private let types: [String] = [
        "poison", "fire", "water", "electric", "grass", "ice",
        "fighting", "normal", "ground", "flying", "psychic", "bug",
        "rock", "fairy", "dragon", "steel", "ghost"
    ]

    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    
                    TextField("Pokemon name", text: $searchName)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    LazyVGrid(columns: gridItems, spacing: 20) {
                        ForEach(viewModel.pokemon.filter { pokemon in
                            (selectedType.isEmpty || pokemon.type.lowercased() == selectedType) && (searchName.isEmpty || pokemon.name.localizedCaseInsensitiveContains(searchName))
                        }) { pokemon in
                            PokemonCellView(pokemon: pokemon)}
                    }
                }
                .navigationTitle("Pokedex - Gen 1")
                .padding(4)
                
                if isMenuOpen {
                        TypeMenuFilterView(types: types, selectedType: $selectedType)
                            .frame(width: 300, height: 230)
                            .transition(.move(edge: .trailing))
                            .position(x: UIScreen.main.bounds.width - 143, y: UIScreen.main.bounds.height - 425)
                }
                
                Button(action: {
                    withAnimation {
                        isMenuOpen.toggle()
                        selectedType = ""
                            }
                    }) {
                        Image(systemName: "chevron.up.chevron.down")
                                .foregroundColor(.black)
                                .font(.system(size: 45))
                        }
                        .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 250)
                }
            }
        }
    }

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
