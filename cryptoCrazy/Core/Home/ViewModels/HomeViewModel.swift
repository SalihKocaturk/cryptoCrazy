//
//  HomeViewModel.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 1.12.2023.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject{
    @Published var  allCoins:[CoinModel] = []
    @Published var  portfolioCoins:[CoinModel] = [] //published objeler sayesinde devamlı yenilenen dataları kullanabiliyoruz
    private let dataService = coinDataServices()
    private var cancelables = Set<AnyCancellable>()
    init(){
addSubscribers()
        
    }
    func addSubscribers(){
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }.store(in: &cancelables)
        
    }
}
