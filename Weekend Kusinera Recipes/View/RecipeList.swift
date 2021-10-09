//
//  RecipeList.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 9/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct RecipeList: View {
    
    var recipes: Recipe
    
    var body: some View {
        //Text(quotes.name)
        ZStack {
            Image(recipes.image)
                .resizable()
                .frame(width: 400.0, height: 400.0)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(50)
                .clipped()
                  
            VStack (alignment: .center) {
                Text(recipes.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("- " + recipes.cuisine)
                   .multilineTextAlignment(.center)
                   .foregroundColor(.white)
                
            }
            
         }
        
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
  
        RecipeList(recipes: Recipe(id: UUID(), name: "Humba Bisaya", cuisine: "Filipino", ingredients: ["Pork Belly","Soy Sauce"], procedure: ["1. Marinate", "2. Saute"], image: "IMG_2028") )
        
    }
}
