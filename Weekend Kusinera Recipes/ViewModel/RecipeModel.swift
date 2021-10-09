//
//  RecipeModel.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 9/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import Foundation

class RecipeModel: ObservableObject  {
    
    @Published var recipe =  [Recipe]()
    
    init() {
        let service = DataServices()
        recipe = service.getRecipeData()

        
    }  // init
    
 
    
}
