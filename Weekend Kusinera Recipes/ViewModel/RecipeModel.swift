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
        self.recipe = service.getRecipeData()

        
    }  // init
    
 
    //static func calculateQty (ing: Ingredients, oneServing: Int, multServ: Int) -> String {
    static func calculateQty (ing: Ingredients, multServ: Int, addToList: Bool) -> String {
     
        var serving = ""
        var numer = ing.num ?? 1
        var denom = ing.denom ?? 1
        var wholeNum = 0
        var unit = ""
        var fullingredient = ""
    
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
            serving += String(wholeNum).trimmingCharacters(in: .whitespaces)
        }
        else {
            if numer != denom {
                serving += "\(numer)/\(denom)"
            }
        }
    
   
        if (wholeNum > 0 &&  numer > 0 ) {
           serving += wholeNum > 0 ? "" : ""
            if numer != denom {
                serving += "\(numer)/\(denom)"
            }
       }
    
        
    }
    
        
    //determine suffix for plural
    if ing.unit != nil {
        
        unit = ing.unit
        
        if wholeNum > 1 {
            if ing.unit.suffix(2) == "ch" {
                unit += "ves"
            }
            else {
                unit += "s"
            }
        }
        
        //return serving + " " + unit
        serving = serving + " " + unit
        
        if addToList == true {
            fullingredient = serving + " " + ing.name
            print(fullingredient)
        }

    }
    
        
    return serving
    
    }
    
    
    static func fetchHighlights(r: Array<String>) -> String {
       
        var allHighlights = ""
        
        for i in 0..<r.count {
            if i < r.count - 1 {
                allHighlights += r[i] + ","
            }
            else {
                allHighlights += r[i]
            }
        }
        
        return (allHighlights)
    }
    
}

