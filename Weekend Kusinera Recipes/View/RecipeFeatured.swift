//
//  RecipeFeatured.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 13/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct RecipeFeatured: View {
    
    @EnvironmentObject var model: RecipeModel

    var body: some View {
        
    VStack {
        Text("Weekend Kusinera's Featured Recipes")
                .bold()
                .multilineTextAlignment(.center)
                .padding()
        
        
        GeometryReader { geo in
            
            ScrollView (.horizontal, showsIndicators: true) {
                
              //  ZStack {
                    //Rectangle().foregroundColor(.white)
                   
                    
                    HStack {
                        ForEach(self.model.recipe) {m in
                                 if (m.featured == true) {
                                        VStack {
                                            
                                            Text(m.name)
                                                 .foregroundColor(.black)
                                                 .padding()
                                            
                                            Text("Cuisine : \(m.cuisine)")
    
                                            Image (m.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipped()
                                            
  //                                          ForEach(0...m.highlights.count-1) { index in
  //                                              Text(highlights[index])
  //                                          }
                                            
                                         }
                                }
                          }
                   }

                 }.frame(width: geo.size.width - 30 , height: geo.size.height-50, alignment: .center)
                 .cornerRadius(20)
                 .shadow(color: Color (.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            
        }
        
        

    
        }
        
            
    }
}

struct RecipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatured()
    }
}
