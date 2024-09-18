//
//  CoinManager.swift
//  ByteCoin
//
//  Created by I L H A N on 05.05.2022.
//


import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin:CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var baseURL : String?
    var apiKey : String?
    
    var delegate : CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    mutating func getBaseUrl(){
        var config: [String: Any]?
        if let infoPlistPath = Bundle.main.url(forResource: "Secrets", withExtension: "plist")
        {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                    baseURL = config?["baseURL"] as? String
                    apiKey = config?["apiKey"] as? String
                }
            } catch {
                print("There was an error getting the Url: \(error)")
            }
        }
    }
    
    func getCoinPrice(for currency: String)  {
        let urlString = "\(baseURL ?? "")/\(currency)?apikey=\(apiKey ?? "")"
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
                    print("Error!")
                    delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let coin = self.parseJSON(safeData){
                        self.delegate?.didUpdateCoin(self, coin:coin)
                        
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data)->CoinModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            let coin = CoinModel(rateValue: rate)
            return coin
        } catch {
            delegate?.didFailWithError(error: error)
            print("Coinmanager - \(error)")
            return nil
        }
    }
}
