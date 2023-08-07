//
//  TypeMenuView.swift
//  Pokedex
//
//  Created by Joao Nascimento on 7.8.2023.
//

import SwiftUI

struct TypeMenuFilterView: View {
    let types: [String]
    @Binding var selectedType: String
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack(spacing: 8) {
                    ForEach(types, id: \.self) { type in
                        Button(action: {
                            selectedType = type
                        }) {
                            Image(systemName: "circle.fill")
                                .foregroundColor(detectColor(pokemonType: type))
                                .font(.system(size: 45))
                                .padding(10)
                                .overlay(
                                    Image(systemName: generateIcon(type: type))
                                        .foregroundColor(.white)
                                        .font(.system(size: 25))
                                ).frame(width: 10, height: 10)
                        }
                        .frame(width: 30, height: 30)
                        .padding(10)
                    }
                }
                .padding(5)
                .cornerRadius(10)
                .shadow(radius: 5)
                .position(x: UIScreen.main.bounds.width - 150, y: UIScreen.main.bounds.height - 300)
            }
        }
    }
}


struct TypeMenuFilterView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let selectedType = Binding.constant("")
               
        let types: [String] = [
            "poison", "fire", "water", "electric", "grass", "ice",
            "fighting", "normal", "ground", "flying", "psychic", "bug",
            "rock", "fairy", "dragon", "steel", "ghost"
        ]
        TypeMenuFilterView(types: types, selectedType: selectedType)
            .background(.gray)
    }
}
