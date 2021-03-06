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
    //@Published var myCart:[(Int, String)] = []
    // @Published var myCart:[String] = []
    // @Published var tempCart:[String] = []
    // @Published var cart = [Cart]()
    @Published var ing:[Ingredients] = []
    // var listcount = 0
    
    init() {
        let service = DataService()    //DataServices()
        self.recipe = service.getRecipeData()
        //self.cart = service.getCartData()
        //self.myCart = service.getMyCartData()
        // self.tempCart = service.getTempCartData()
        self.ing = service.getIngredientData()
        
    }  // init
    
    
    //Calculate required ingredients
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
            
            serving = serving + " " + unit
            
            //check if Add to Cart is pressed
            if addToList == true {
                ing.inlist = true
                fullingredient = serving + " " + ing.name
                ing.shopitem = fullingredient
                print(fullingredient)
            }
            
        }
        return serving
        
    }
    
    //Fetch highlights for the recipe
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


