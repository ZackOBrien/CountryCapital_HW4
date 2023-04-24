//
//  ViewModel.swift
//  hw-4_CountryCapital_ZO
//
//  Created by Zack O'Brien on 10/11/22.
//

import Foundation

class ViewModel : ObservableObject{
    @Published var country_capitals = [CountryCapital]()
    
    init(){
        readJSONFile()
    }
    
    
    func changeFav(cap: CountryCapital){
        // use cap to find itself in the courtry_array, then modify that
        for i in 0..<country_capitals.count{
            if country_capitals[i].id == cap.id{
                country_capitals[i].favorite = !(country_capitals[i].favorite ?? false)
            }
        }
    }
    
    func readJSONFile(){
        
        // 1. pathString
        let pathString = Bundle.main.path(forResource: "country_capitals", ofType: "json")
        
        
        if let path = pathString{
            
            // 2. URL
            let url = URL(fileURLWithPath: path)
            
            // 3. Data object
            do{
                let data = try Data(contentsOf: url)
                
                // 4. json decoder
                let jsonDecoder = JSONDecoder()
                
                // 5. get json data
                var jsonData = try jsonDecoder.decode(AllCountryCapital.self, from: data)
                
                for i in 0..<jsonData.results.count {
                    jsonData.results[i].id = UUID()
                }
                
                country_capitals = jsonData.results
                
                
            } catch{
                print("slayyyy ")
                
            }
            
        }else{
            
        }
        
    }
}
