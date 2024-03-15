//
//  coinDataServices.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 14.12.2023.
//

import Foundation
import Combine
class coinDataServices{
    
    @Published var allCoins : [CoinModel] = []
    
    var coinSubscription : AnyCancellable?
    init(){
     
        getCoins()
        
    }
    private func getCoins(){
        guard let url = URL(string:  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en")
        else{
            return
            
        }
        if url ==  URL(string:  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") {
            print("url done")
            print(url)
        }
        coinSubscription = NetworkingManager.download(url: url)
        //decode data 
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompeltion(completion:), receiveValue: {[weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
            
            
        
        
    }
    
}
