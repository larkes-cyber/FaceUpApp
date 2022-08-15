//
//  ContentView.swift
//  FaceUpApp
//
//  Created by Admin on 09.08.2022.
//  Copyright © 2022 Admin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var viewModel: EmojiMemoryGame
    
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
        
        GeometryReader{geometry in
            self.body(for: geometry.size)
        }
            
    }
    
    func body(for size: CGSize) -> some View{
        ZStack{
            if self.card.isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .font(Font.system(size: min(size.width,size.height) * factoryFontSize))
    }
    
    //View constants
    
    let cornerRadius:CGFloat = 10.0
    let edgeLineWidth:CGFloat = 3
    let factoryFontSize:CGFloat = 0.75
    
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(viewModel: EmojiMemoryGame())
    }
}
