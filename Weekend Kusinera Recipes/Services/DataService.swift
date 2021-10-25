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
