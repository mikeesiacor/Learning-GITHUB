//
//  Recipe.swift
//  Quotes
//
//  Created by Michelle Siacor on 8/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var cuisine: String
    var ingredients: [String]
    var procedure: [String]
    var image: String
    
}
