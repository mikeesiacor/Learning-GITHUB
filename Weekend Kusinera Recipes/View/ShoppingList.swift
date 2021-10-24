//
//  ShoppingList.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 21/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct ShoppingList: View {
    
    @EnvironmentObject var model: RecipeModel
    
     
    var body: some View {
 
        VStack  {
            Text("Weekend Kusinera's Cart")
                .font(.headline)
                .bold()
            
            ScrollView  {
                 ForEach(self.model.recipe) {m in
                    ForEach(m.ingredients) {ing in
                        if (ing.inlist == true && ing.shopitem != nil) {
                            
                            Text(ing.shopitem)
                                .multilineTextAlignment(.leading)
                            
                          }
                     }
                    
                 }
                
            }
            

        }
        
         //Text("Your Shopping Cart is Empty")
    }
}

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
    }
}
