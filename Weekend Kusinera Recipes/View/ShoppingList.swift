//
//  ShoppingList.swift
//  Weekend Kusinera Recipes
//
//  Created by Mikee Siacor on 21/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct ShoppingList: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
       
        VStack {
            Text("Weekend Kusinera's Cart")
                .font(.headline).font(Font.custom("Avenir Heavy", size: 18))
                .bold()
            
            List(model.ing) {m in
                VStack {
                    Text(m.shopitem)
                        .font(Font.custom("Avenir", size: 16))
                }
            }
            
        }
        
        /*
        ScrollView  {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Weekend Kusinera's Cart")
                    .font(.headline).font(Font.custom("Avenir Heavy", size: 18))
                    .bold()
                
                ForEach(0 ..< model.ing.count, id: \.self){value in
                    Text(String(self.model.ing[value].shopitem))
                        .font(Font.custom("Avenir", size: 16))
                        
                }
                
            }
        }
        */
    }
}

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
    }
}
