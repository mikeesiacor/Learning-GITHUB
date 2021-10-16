//
//  MathFunc.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 15/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import Foundation

struct MathFunc {

    static func calculateGCD(_ a: Int, _ b: Int) -> Int {
        
        // GCD(0, b) = b
        if a == 0 { return b }
        
        // GCD(a, 0) = a
        if b == 0 { return a }
        
        // Otherwise, GCD(a, b) = GCD(b, remainder)
        return calculateGCD(b, a % b)
    }
    
}
