//
//  DataServices.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 9/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import Foundation

class DataServices {
    
    func getRecipeData() -> [Recipe]
    {
        let dataPath = Bundle.main.path(forResource: "data", ofType: "json")
        
        // check if path is empty
        guard dataPath != nil else {
            return [Recipe]()
        }
        
        let dataURL =  URL(fileURLWithPath:dataPath!)
        
        //create a Data Object
        do {
             let dataObj =  try Data(contentsOf: dataURL)
             let decoder = JSONDecoder()
             do {
                var recipedata = try decoder.decode([Recipe].self, from: dataObj)
                for index in 0...recipedata.count - 1 {
                    recipedata[index].id = UUID()
                }
                return recipedata
             }
             catch {
                //error with decoder
                print(error)
            }
        }
        catch {
            //error with Data Object
            print(error)
        }
        
        return [Recipe]()
      
    
    }  //getQuotesData
}
