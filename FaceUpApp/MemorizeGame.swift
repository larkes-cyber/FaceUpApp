//
//  MemorizeGame.swift
//  FaceUpApp
//
//  Created by Admin on 10.08.2022.
//  Copyright © 2022 Admin. All rights reserved.
//

struct MemoryGame<CardContent>{
    
    var cards:Array<Card>
    
    func choose(card:Card){
        print("card choosen: \(card)")
    }
    
    struct Card {
        var isFaceUp:Bool
        var isMatched:Bool
        var content:CardContent
    }
    
}

import Foundation
