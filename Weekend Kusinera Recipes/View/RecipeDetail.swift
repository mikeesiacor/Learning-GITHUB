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
    @State var added = false
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        ScrollView {
            
            
            VStack (alignment: .leading, spacing: 5) {
                Text(recipe.name)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .bold()
                
                Image(recipe.image)
                    .resizable()
                    .frame(width: 400.0, height: 400.0, alignment: .leading)
                
                HStack {
                    Text("Serving Size:")
                        .font(Font.custom("Avenir Heavy", size: 16))
                    Picker("", selection: $selectedServingSize) {
                        Text("1x").tag(1)
                        Text("2x").tag(2)
                        Text("3x").tag(3)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                
                Button(action: {
                    self.added = true
                }, label: {
                    HStack{
                        Image(systemName: "cart.badge.plus")
                        Text("Add to List")
                            .font(Font.custom("Avenir", size: 14))
                    }
                }).padding(.trailing)
                
                Text("Ingredients: ")
                    .font(Font.custom("Avenir Heavy", size: 16))
                    .bold()
                    .multilineTextAlignment(.leading)
                
                
                
                ForEach (recipe.ingredients) { item in
                    
                    HStack {
                        //Text(RecipeModel.calculateQty(ing: item, multServ: self.selectedServingSize) )
                        Text(RecipeModel.calculateQty(ing: item, multServ: self.selectedServingSize, addToList: self.added) )
                            .font(Font.custom("Avenir", size: 16))
                        
                        Text(item.name)
                            .font(Font.custom("Avenir", size: 16))
                        
                    }  //HSTack
                }
                
                Spacer()
                
                Text("Procedure: ")
                    .font(Font.custom("Avenir Heavy", size: 16))
                    .bold()
                    .multilineTextAlignment(.leading)
                
                ForEach (recipe.procedure, id:\.self) {p in
                    Text(p)
                        .font(Font.custom("Avenir", size: 16))
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                
            }
            
            
            
        }.onDisappear {
            self.model.ing.append(contentsOf: self.recipe.ingredients)
             
            DataService.updateRecipeData(ing: self.model.ing)
        }
        
    }
    
    
    struct RecipeDetailView_Previews: PreviewProvider {
        static var previews: some View {
            
            let model = RecipeModel()
            
            return RecipeDetail(recipe: model.recipe[0])
            
            
            
        }
    }
}



