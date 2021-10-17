//
//  RecipeDetail.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 9/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct RecipeDetail: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 1
 
     
    var body: some View {
  
        ScrollView {
            
    
                VStack {
                     Text(recipe.name)
                        .font(.headline)
                        .bold()

                    Image(recipe.image)
                          .resizable()
                          .frame(width: 400.0, height: 400.0, alignment: .leading)
                    
                    HStack {
                             Text("Serving Size:")
                             Picker("", selection: $selectedServingSize) {
                                 Text("1x").tag(1)
                                 Text("2x").tag(2)
                                 Text("3x").tag(3)
                              }
                             .pickerStyle(SegmentedPickerStyle())
                             .frame(width:160)
                         }
                         .padding()
                    
                      
                    Text("Ingredients: ")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                    
                    
                    ForEach (recipe.ingredients) { item in
                        
                         HStack {
                            Text(RecipeModel.calculateQty(ing: item, multServ: self.selectedServingSize) )
                        
                            //if item.num != nil {
                            //    Text(" \(item.num!) \(item.unit)")
                            // }
                            
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



struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {

        let model = RecipeModel()
        
        return RecipeDetail(recipe: model.recipe[0])
        
  
        
    }
}
