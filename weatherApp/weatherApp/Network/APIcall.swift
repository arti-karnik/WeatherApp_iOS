//
//  APIcall.swift
//  weatherApp
//
//  Created by Arti Karnik on 6/18/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

class APIcall: NSObject {
    
    // MARK:Geocode API
    func callGeocodeAPIwithCityName(_cityName: String, onSuccess: @escaping (Location?) -> Void, onError: @escaping (String) -> Void) {
        
        let buildURL = weather().buildGeocodeURL(_cityName: _cityName)
           
        guard let url = URL(string: buildURL) else {return }

        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            let decoder = JSONDecoder()

            if let data = data{
                do{
                    let location = try JSONDecoder().decode([Location].self, from: data)
                    
                    if location.count > 0 {
                        onSuccess(location[0])
                    }else {
                       onSuccess(nil)
                    }
                   
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    // MARK: Weather API
    func callweatherAPIwithLocation(_lat: String, _lon: String, onSuccess: @escaping (Current) -> Void, onError: @escaping (String) -> Void) {
        let buildURL = weather().buildCityURL(lat: _lat, lon: _lon)
           
        guard let url = URL(string: buildURL) else {return }

        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            let decoder = JSONDecoder()

            if let data = data{
                do{
                    let location = try JSONDecoder().decode(Current.self, from: data)
                    onSuccess(location)
                   
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    // MARK:Location API
    func callforecastAPIwithLocation(_lat: String, _lon: String, onSuccess: @escaping (forecast) -> Void, onError: @escaping (String) -> Void) {
           let buildURL = weather().buildForecastURL(lat: _lat, lon: _lon)
              
           guard let url = URL(string: buildURL) else {return }

           let task = URLSession.shared.dataTask(with: url){
               data, response, error in
               
               let decoder = JSONDecoder()

               if let data = data{
                   do{
                       let data = try JSONDecoder().decode(forecast.self, from: data)
                       onSuccess(data)
                      
                   }catch{
                       print(error)
                   }
               }
           }
           task.resume()
       }
}
