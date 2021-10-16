//
//  Recipe.swift
//  Quotes
//
//  Created by Michelle Siacor on 8/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var featured: Bool
    var cuisine: String
    var portionsize: Int
    var highlights: [String]?
    var ingredients: [Ingredients]
    var procedure: [String]
    var image: String
    
}

class Ingredients: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String
    
}
