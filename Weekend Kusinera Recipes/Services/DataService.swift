import Foundation

class DataService {
    
    
    //fetch data
    func getRecipeData() -> [Recipe]
    {
        let dataPath = Bundle.main.path(forResource: "data", ofType: "json")
        
        // check if path is empty
        guard dataPath != nil else {
            return [Recipe]()
        }
        
        let dataURL =  URL(fileURLWithPath:dataPath!)
        
        //create a Data Object
        do {
            let dataObj =  try Data(contentsOf: dataURL)
            let decoder = JSONDecoder()
            do {
                var recipedata = try decoder.decode([Recipe].self, from: dataObj)
                for index in 0...recipedata.count - 1 {
                    recipedata[index].id = UUID()
                    
                    for i in recipedata[index].ingredients {
                        i.id = UUID()
                    }
                }
                
                return recipedata
            }
            catch {
                //error with decoder
                print(error)
            }
        }
        catch {
            //error with Data Object
            print(error)
        }
        
        return [Recipe]()
        
        
    }  //getQuotesData
    
    
    
    //MARK:updateRecipeData
    //write updates
    static func updateRecipeData(ing: [Ingredients]) -> Void {
        
         let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //let documentDirectory = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask).first!
        
        let jsonURL = documentDirectory
            .appendingPathComponent("mycart2")
            .appendingPathExtension("json")
        
        //try? JSONEncoder().encode(recdata).write(to: jsonURL, options: .atomic)
        
        do {
            var recipedata = try JSONEncoder().encode(ing).write(to: jsonURL, options: .atomic)
        }
        catch {
            print("in updateRecipeData \(error)")
        }
        //print("in updateRecipeData" )
    }
    
    
    
 
    
  //MARK:getIngredientData
  //Fetch previously saved ingredients for shopping list
    func getIngredientData() -> [Ingredients]  {
        
        var tempArr = [Ingredients]()
        
        do {
            //let fileURL = try FileManager.default
            //    .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            //    .appendingPathComponent("mikee.json")
            
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("mycart2.json")
            
            
            guard fileURL != nil else {
                return [Ingredients]()
            }
            
            let cartObj = try Data(contentsOf: fileURL)
            
            let decoder =  JSONDecoder()
            
            do {
                var cartdata = try decoder.decode([Ingredients].self, from: cartObj)
                tempArr = cartdata
                
                return tempArr
            }
            catch {
                //error with decoder
                print("in getIngredientData \(error)")
            }
            
            
        } catch {
            print("in getIngredientData 2 \(error)")
        }
        
        return tempArr
        
        
    }
    
}




