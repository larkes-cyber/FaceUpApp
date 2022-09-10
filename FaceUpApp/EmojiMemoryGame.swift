//
//  EmojiMemoryGame.swift
//  FaceUpApp
//
//  Created by Admin on 10.08.2022.
//  Copyright © 2022 Admin. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject{
    
   @Published private var model:MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        
        let array = ["👻","🎃","👻"]
        
        return MemoryGame<String>(numberOfPairs: array.count){pairIndex in
            return array[pairIndex]
        }
        
    }
   //     MemoryGame<String>(numberOfPairs: 12) { _ in "👻" }
    
    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(card:MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}
