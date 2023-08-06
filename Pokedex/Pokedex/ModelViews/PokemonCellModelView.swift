//
//  PokemonCellModelView.swift
//  Pokedex
//
//  Created by Joao Nascimento on 6.8.2023.
//

import Foundation
import SwiftUI

struct RoundedBackgroundView: View{
    
    var name: String
    var pokedexNum: String
    var type: String
    var backgroudColor: Color
    
    var body: some View{
        ZStack{
            VStack(alignment: .leading){
                Text(name + " " + pokedexNum)
                    .font(.headline).bold()
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                
                HStack{
                    Text(type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.2))
                        )
                        .frame(width:100, height: 24)
                    
                    Image("bulba")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
            .background(backgroudColor)
            .cornerRadius(12)
            .shadow(color: .green, radius: 6, x:0.0 , y: 0.0)
        }
    }
}

struct RoundedBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedBackgroundView(name: "Bulbasaur", pokedexNum: "#001", type: "grass", backgroudColor: .green)
            
    }
}
