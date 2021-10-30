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
  
               // ForEach(model.cart) {c in
               //     Text(c.cartitem)
               // }
                
                //ForEach(0 ..< model.myCart.count, id: \.self) {value in
                //Text(self.model.myCart[value])
                //   }
                
                
                ForEach(0 ..< model.ing.count, id: \.self){value in
                    //Text("hello")
                    //Text(String(ing[value]["name"]))
                    Text(String(self.model.ing[value].shopitem))
                }
                
                
                
                
                
                //for (index, value) in model.myCart.enumerated() {
                //    Text(value)
                //}
                 
                /*
                 ForEach(self.model.recipe) {m in
                    ForEach(m.ingredients) {ing in
                        if (ing.inlist == true && ing.shopitem != nil) {
                            
                            Text(ing.shopitem)
                                .multilineTextAlignment(.leading)
                            
                          }
                     }
                    
                 }
                */
            }
            
           
        }.onDisappear {
            //RecipeModel.saveCart(m:self.model)
           // DataService.updateRecipeData(recdata: [Recipe])
        }
        
        
         //Text("Your Shopping Cart is Empty")
    }
}

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
    }
}
