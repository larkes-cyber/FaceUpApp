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
        
        return Grid(viewModel.cards){card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
        .padding(5)
        }
//        return HStack{
//            ForEach(viewModel.cards) { card in

//            }
//        }
        
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
    
    @ViewBuilder 
    func body(for size: CGSize) -> some View{
        
        if card.isFaceUp || !card.isMatched{
            ZStack{
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .opacity(0.4)
                    .padding(5)
                Text(self.card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            }
            .cardify(isFaceUp:card.isFaceUp)
            .font(Font.system(size: min(size.width,size.height) * factoryFontSize))
        }
      
    }
    
    //View constants
    

    let factoryFontSize:CGFloat = 0.75
    
}










struct ContentView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        
        var game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        
        return ContentView(viewModel: game)
    }
}
