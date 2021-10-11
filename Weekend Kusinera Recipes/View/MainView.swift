//
//  MainView.swift
//  Weekend Kusinera Recipes
//
//  Created by Michelle Siacor on 11/10/21.
//  Copyright © 2021 Mikee Siacor. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State var tabIndex = 0
    
    var body: some View {

        TabView (selection: $tabIndex) {
            
            //Featured Recipes
            Text("Featured Recipes")
                .tabItem {
                    VStack{
                        Image(systemName: "star.circle")
                        Text("Featured")
                    }
            }.tag(0)
            
            //Recipe List
            // RecipeList(recipes: Recipe(id: UUID(), name: "Humba Bisaya", cuisine: "Filipino", ingredients: ["Pork Belly","Soy Sauce"], procedure: ["1. Marinate", "2. Saute over high heat"], image: "IMG_2028") )
            ContentView()
                .tabItem  {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
            }.tag(1)
        }
        
    }


//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
