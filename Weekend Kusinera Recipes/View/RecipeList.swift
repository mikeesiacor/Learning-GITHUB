//
//  ContentView.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 9/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct RecipeList: View {
    
    //@ObservedObject var model = RecipeModel()
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack{
              
            List(model.recipe) {m in
                NavigationLink (
                    destination: RecipeDetail(recipe: m),
                    label:{
                        //ZStack {
                        
                        VStack {
                            HStack {
                                Image(m.image)
                                    .resizable()
                                    .frame(width: 50.0, height: 50.0)
                                    .cornerRadius(5)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                
                                    Text(m.name)
                                        .foregroundColor(.black)
                                        .font(.subheadline)
                                }
                                
                               // Text("Cuisine: " + m.cuisine)
                                       .font(.footnote)
                                       .padding()
                                       .foregroundColor(.black)

                        }
                        
                }
                )
                            }
                                        }.navigationBarTitle("Weekend Kusinera's Recipes")
        }
  
        
    }
}


struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
