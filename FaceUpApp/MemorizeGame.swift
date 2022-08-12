//
//  MemorizeGame.swift
//  FaceUpApp
//
//  Created by Admin on 10.08.2022.
//  Copyright © 2022 Admin. All rights reserved.
//
import Foundation

struct MemoryGame<CardContent>{
    
    var cards:Array<Card>
    
    mutating func choose(card:Card){
        print("card choosen: \(card)")
        
        let chooseIndex:Int = self.getCardIndex(of: card)
        self.cards[chooseIndex].isFaceUp = !self.cards[chooseIndex].isFaceUp
        
    }
    
    func getCardIndex(of card:Card) -> Int{
        
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id{
                return index
            }
        }
        
        return 0 //TODO: bug
        
    }
    
    init(numberOfPairs:Int, cardContentFactroy: (Int) -> CardContent){
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairs {
            
            let content = cardContentFactroy(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
    }
    
    struct Card:Identifiable {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
        var id:Int
    }
    
}


