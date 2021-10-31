//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-02-09.
//

import SwiftUI

struct RecipeFeatured: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                GeometryReader { geo in
                    ScrollView (.horizontal, showsIndicators: true) {
                        
                        HStack(spacing: 0) {
                            ForEach(self.model.recipe) {m in
                                if (m.featured == true) {
                                    NavigationLink(destination: RecipeDetail(recipe: m) ,
                                                   label: {
                                                    VStack {
                                                        
                                                        Text(m.name)
                                                            .font(Font.custom("Avenir Heavy", size: 18))
                                                            .bold()
                                                            .multilineTextAlignment(.leading)
                                                        
                                                        Image(m.image)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .clipped()
                                                            .frame(width: 500, height: 500, alignment: .topLeading)
                                                            .offset(x: 2, y: 2)
                                                        
                                                        Text("Cuisine : \(m.cuisine)")
                                                            .font(Font.custom("Avenir", size: 16))
                                                        
                                                        HStack {
                                                            Text("***")
                                                                .font(Font.custom("Avenir", size: 16))
                                                            Text(RecipeModel.fetchHighlights(r: m.highlights))
                                                                .font(Font.custom("Avenir", size: 16))
                                                            Text("***")
                                                                .font(Font.custom("Avenir", size: 16))
                                                        }
                                                        
                                                        
                                                    }
                                    }
                                    ).buttonStyle(PlainButtonStyle())
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    
                }.navigationBarTitle("Recommended Recipes").font(Font.custom("Avenir Heavy", size: 24))
                
            }
            
            
            
        }
        
        
    }
}


struct RecipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatured()
            .environmentObject(RecipeModel())
    }
}
