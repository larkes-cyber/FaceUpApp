//
//  Array+Identifiable.swift
//  FaceUpApp
//
//  Created by Admin on 18.08.2022.
//  Copyright © 2022 Admin. All rights reserved.
//

import Foundation

extension Array where Element:Identifiable{
    
    func firstIndex(matching:Element) -> Int?{
        
        for i in 0..<self.count{
            if self[i].id == matching.id{
                return i
            }
        }
        return nil
        
    }
}
