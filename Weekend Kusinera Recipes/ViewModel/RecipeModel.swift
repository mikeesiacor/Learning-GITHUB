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
    
 
    //static func calculateQty (ing: Ingredients, oneServing: Int, multServ: Int) -> String {
    static func calculateQty (ing: Ingredients, multServ: Int) -> String {
     
        var serving = ""
        var numer = ing.num ?? 1
        var denom = ing.denom ?? 1
        var wholeNum = 0
    
    if ing.num != nil {
    
        //denom = denom*oneServing
        numer = numer*multServ
    
        let divi = MathFunc.calculateGCD(numer,denom)
    
        numer = numer/divi
        denom = denom/divi
    
        //check if whole number
        if numer >= denom {
            wholeNum = numer/denom
            numer = numer % denom
            serving += String(wholeNum)
        }
        else {
            if numer != denom {
                serving += "\(numer)/\(denom)"
            }
        }
    
   
        if (wholeNum > 0 &&  numer > 0 ) {
           serving += wholeNum > 0 ? " " : ""
            if numer != denom {
                serving += "\(numer)/\(denom)"
            }
       }
    
        
    }
    
        if ing.unit != nil {
            
            
            
            
            return serving + " " + ing.unit
        }
        
        return serving
    
    }
    
    
}

