//
//  Cart.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 22/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import Foundation

class Cart:  Identifiable, Codable {
   // var id: UUID?
   // var cartitem: String = ""
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String
    var inlist: Bool
    var shopitem: String
    
}
