//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        ZStack{
            HStack{
                RoundedBackgroundView(name: "Bulbasaur", pokedexNum: "#001", type: "grass", backgroudColor: .green)
            }
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell()
    }
}
