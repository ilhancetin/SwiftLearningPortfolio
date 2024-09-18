//
//  WeatherManager.swift
//  Clima
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 13/09/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather:WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    
    var delegate : WeatherManagerDelegate?
    var weatherURL : String?
    
    mutating func getWeatherUrl(){
        var config: [String: Any]?
        if let infoPlistPath = Bundle.main.url(forResource: "Secrets", withExtension: "plist")
        {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                    weatherURL = config?["weatherURL"] as? String
                }
            } catch {
                print("There was an error getting the Url: \(error)")
            }
        }
    }
    
    
    func fetchWeather(cityName: String){
        
        let urlString = "\(self.weatherURL ?? "")&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitud: CLLocationDegrees, longitud: CLLocationDegrees){
        let urlString = "\(self.weatherURL ?? "")&lat=\(latitud)&lon=\(longitud)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String)
    {
        //1. Create a Url
        
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather:weather)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data)->WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            
            let temp = decodedData.main.temp
            let name = decodedData.name
            let lat = decodedData.coord.lat
            let lon = decodedData.coord.lon
            
            let weather = WeatherModel(conditionId: id, cityName: name, latitude: lat, longitud: lon, temperature: temp)
            
            
            print(weather.conditionName)
            print(weather.temperatureString)
            return weather
        }catch{
            delegate?.didFailWithError(error: error)
            print("Weathermanager - \(error)")
            return nil
        }        
    }
    
    
    
}
