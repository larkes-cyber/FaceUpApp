//
//  ContentView.swift
//  FaceUpApp
//
//  Created by Admin on 09.08.2022.
//  Copyright © 2022 Admin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View{
        
        return HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
            
        
    }
    
}

struct CardView:View {
    var card:MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 3)
                Text("👻")
            }else{
               RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(viewModel: EmojiMemoryGame())
    }
}
