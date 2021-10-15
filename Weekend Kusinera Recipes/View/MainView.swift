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
              RecipeFeatured()
                .tabItem {
                    VStack{
                        Image(systemName: "star.circle")
                        Text("Featured")
                    }
            }.tag(0)
            
            //Recipe List
            RecipeList()
                .tabItem  {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
            }.tag(1)
        }.environmentObject(RecipeModel())
        
    }


//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
