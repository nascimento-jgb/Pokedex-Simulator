//
//  PokedexModelView.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import SwiftUI

struct PokedexModelView: View {
    
    @State private var searchName = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid{
                    
                }
            }
        }
    }
}

struct PokedexModelView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexModelView()
    }
}
