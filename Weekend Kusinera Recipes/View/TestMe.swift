//
//  RecipeDetail.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 9/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct TestMe: View {
    
    var recipe:Recipe

     
    var body: some View {
  
        ScrollView {
            
    
                VStack {
                    Text(recipe.name)
                        .font(.title)
                        .bold()

                    Image(recipe.image)
                          .resizable()
                          .frame(width: 400.0, height: 400.0, alignment: .leading)
                    

                    
                      
                    Text("Ingredients: ")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                     
                    ForEach (recipe.ingredients) { item in
                        HStack {
                            
                            Text(item.name)
                             }  //HSTack
                         }
                     }
                      
                        Spacer()
                        
                        Text("Procedure: ")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        ForEach (recipe.procedure, id:\.self) {p in
                                Text(p)
                                    .multilineTextAlignment(.leading)
                            }
                        Spacer()
                        
                 }
            
        }

     
    }



struct TestMe_Previews: PreviewProvider {
    static var previews: some View {

        let model = RecipeModel()
        
        return RecipeDetail(recipe: model.recipe[0])
        
  
        
    }
}
