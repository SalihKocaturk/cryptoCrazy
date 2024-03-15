//
//  CoinImageViewModel.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 17.12.2023.
//

import Foundation
import SwiftUI
import Combine
class CoinImageViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private let coin: CoinModel
    private let dataService: CoinImageDataService
    private var Cancellables = Set<AnyCancellable>()
    init(coin: CoinModel){
        self.coin = coin
        self.dataService = CoinImageDataService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
        
    }
    private func addSubscribers(){
        dataService.$image
            .sink {  [weak self](_) in
                self?.isLoading = false
            } receiveValue: {[weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &Cancellables)
        
    }
    
}
