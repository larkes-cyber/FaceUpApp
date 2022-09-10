//
//  Cardify.swift
//  FaceUpApp
//
//  Created by Admin on 10.09.2022.
//  Copyright © 2022 Admin. All rights reserved.
//

import SwiftUI

struct Cardify:ViewModifier{
    
    var isFaceUp:Bool
    
    func body(content: Content) -> some View {
        
        
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content  
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
    
    let cornerRadius:CGFloat = 10.0
    let edgeLineWidth:CGFloat = 3
    
}
extension View{
    func cardify(isFaceUp:Bool) -> some View{
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
