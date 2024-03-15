//
//  CoinImageDataService.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 17.12.2023.
//

import Foundation
import Combine
import SwiftUI
class CoinImageDataService {
    @Published var image: UIImage? = nil
    private let coin: CoinModel
    private var imageSubscription: AnyCancellable?
    private let fileManager = LocalFileManager.instance
    private let forlderName = "coin_images"
    private let imageName: String
    init(coin: CoinModel){
        
        self.coin = coin
        
        self.imageName = coin.id
        getCoinImage()
    }
    private func getCoinImage(){
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: forlderName){
            image = savedImage
            print("dosya menejerinden alındı")
        }else{
            downloadCoinImage()
        }
        
    }
    private func downloadCoinImage(){
        guard let url = URL(string:  coin.image)
        else{ return }
            
            
            imageSubscription = NetworkingManager.download(url: url)
                .tryMap({ (data) -> UIImage in //fotografa cevirmek istiyoruz
               return UIImage(data: data)!

                })
           
                .sink(receiveCompletion: NetworkingManager.handleCompeltion, receiveValue:
                    {
                    [weak self] (returnedImage) in
                    guard let self = self else {return}
                    self.image = returnedImage
                    self.imageSubscription?.cancel()
                    self.fileManager.saveImage(image: returnedImage, imageName: self.imageName, folderName: self.forlderName)
                })
        }
        }
    

