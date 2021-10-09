//
//  ContentView.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 9/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
  @ ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
              
            List(model.recipe) {m in
                NavigationLink (
                    destination: RecipeDetail(recipe: m),
                    label:{
                        ZStack {
                            Image(m.image)
                                .resizable()
                                .frame(width: 400.0, height: 400.0)
                                .cornerRadius(5)
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            VStack (alignment: .center) {
                                Text(m.name)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Cuisine: " + m.cuisine)
                                   .multilineTextAlignment(.trailing)
                                   .foregroundColor(.white)
                                
                                }
                                }
                            
                }
                )
                    .accessibilityAdjustableAction { direction in
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*//*@END_MENU_TOKEN@*/
                }
                                    }
                                        }.navigationBarTitle("Weekend Kusinera's Recipes")
                                         
            }
  
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
