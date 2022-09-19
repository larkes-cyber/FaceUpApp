//
//  MemorizeGame.swift
//  FaceUpApp
//
//  Created by Admin on 10.08.2022.
//  Copyright © 2022 Admin. All rights reserved.
//
import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable{
    
   private(set) var cards:Array<Card>
    
    var indexOfFirstChosenCard:Int?
    
    mutating func choose(card:Card){
        print("card choosen: \(card)")
        
        if let chosenIndex:Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            
            if let potentialMatchIndex = indexOfFirstChosenCard{
                
                if(cards[potentialMatchIndex].content == cards[chosenIndex].content){
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfFirstChosenCard = nil
                
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfFirstChosenCard = chosenIndex
            }
            
            self.cards[chosenIndex].isFaceUp = true
        }
        
        
        
    }
    

    
    init(numberOfPairs:Int, cardContentFactroy: (Int) -> CardContent){
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairs {
            
            let content = cardContentFactroy(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards = self.shuffing(array: cards)
        
        
    }
    
    private func shuffing(array:Array<Card>) -> Array<Card>{
        
        var newArray = [Card]().self
        var repeatIndexes = [Int]()
        
        while newArray.count != array.count{
            let randomIndex = Int.random(in: 0..<array.count)
            
            if !repeatIndexes.contains(randomIndex){
                newArray.append(array[randomIndex])
                repeatIndexes.append(randomIndex)
            }
        }
        
        return newArray
    }
    
    struct Card:Identifiable {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
        var id:Int
    }
    
}


