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
    
    
    func getCartData() -> [String]  {

    var tempArr = [String]()
        
        do {
             let fileURL = try FileManager.default
                 .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                 .appendingPathComponent("cart.json")
             
             guard fileURL != nil else {
                 return [String]()
             }

             let cartObj = try Data(contentsOf: fileURL)
             
             let decoder =  JSONDecoder()
             
              do {
                 var cartdata = try decoder.decode([Cart].self, from: cartObj)
                 for index in 0...cartdata.count - 1 {
                     cartdata[index].id = UUID()
                    
                    tempArr.append(cartdata[index].cartitem)
                     
                 }
                 
                 return tempArr
              }
              catch {
                 //error with decoder
                 print("in fetchCart  \(error)")
             }
             
             
         } catch {
             print("in fetchCart 2 \(error)")
         }
         
         return tempArr
        
        
        
    }
    
    
    
    //write updates
    static func updateRecipeData(recdata: Recipe) -> Void {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //let documentDirectory = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask).first!
        
        let jsonURL = documentDirectory
            .appendingPathComponent("data")
            .appendingPathExtension("json")
        
        //try? JSONEncoder().encode(recdata).write(to: jsonURL, options: .atomic)
        
        do {
            var recipedata = try JSONEncoder().encode(recdata).write(to: jsonURL, options: .atomic)
        }
        catch {
            print("in updateRecipeData \(error)")
        }
        //print("in updateRecipeData" )
    }
    
    
 
    
    
}
