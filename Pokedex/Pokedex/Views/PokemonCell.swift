//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: PokedexEntry
    
    var body: some View {
        ZStack{
            HStack{
                PokemonCellView(pokemon: MOCK_POKEMON[1])
            }
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON[1])
    }
}
