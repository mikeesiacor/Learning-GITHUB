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
                     
                    Button(action: {
                        self.added = true
                    }, label: {
                        HStack{
                            Image(systemName: "cart.badge.plus")
                            Text("Add to List")
                        }
                    }).padding(.trailing)
                    
                    Text("Ingredients: ")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                    
                    
                    ForEach (recipe.ingredients) { item in
                        
                         HStack {
                            //Text(RecipeModel.calculateQty(ing: item, multServ: self.selectedServingSize) )
                            Text(RecipeModel.calculateQty(ing: item, multServ: self.selectedServingSize, addToList: self.added) )
                        
                            Text(item.name)
                            
                            //Text(Whatever().whatnow(s: item.name))
                            
                            //Text(whatever().test(s: item.name))
                            
                            //if model.cart.append(Cart("id": UUID(), "cartitem": item.name )) {
                            //    Text("a")
                            //}
                            
                            if self.added == true {
                                Temp()
                            }
                                
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
                        
        }.onDisappear {
            //self.model.tempCart.append(contentsOf: self.model.myCart)
            //self.model.myCart.append("bacon")
            //self.model.myCart.append(contentsOf: self.model.tempCart)
            
            self.model.ing.append(contentsOf: self.recipe.ingredients)
            DataService.updateRecipeData(ing: self.model.ing)
            //DataService.updateRecipeData(recdata: self.recipe)
            
            //DataService.updateRecipeData(r: [self.recipe], recdata: [self.recipe])
            //self.model.myCart.append ("test")
           
            /*
            //if self.added == true {
                ForEach (self.recipe.ingredients) {item in
                    //self.model.myCart.append(<#T##newElement: String##String#>)
                    //let temp = item.name
                    //self.model.cart.append(contentsOf: <#T##Sequence#>)
                    Text(item.name)
                    
                }
            // }
            
            
       
            
            for n in 0..<self.recipe.ingredients.count {
                
                //let temp = RecipeModel.calculateQty(ing: item, multServ: self.selectedServingSize, addToList: self.added)
                
                self.model.myCart.append ("test \(n)")
                //self.model.myCart.append()
                
               print("in onDisappear")
        
        }
       */
            
        }
            
        //func test(s: String) -> Void {
            
        //    model.myCart.append(s)
        //   return
        // }
         
        
        
    } //??

   
   
    

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {

        let model = RecipeModel()
        
        return RecipeDetail(recipe: model.recipe[0])
        
  
        
    }
}
}


/*
struct Whatever: View {

     @EnvironmentObject var model: RecipeModel
    
    var body: some View {
           EmptyView()
          
       }
    
    func whatnow(myCart:[String], s: String)-> String {
        var x = myCart
        x.append(s)
        
        return s
    }
}
*/
