//
//  NetworkingManager.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 17.12.2023.
//

import Foundation
import Combine

class NetworkingManager{
    enum networkingError: LocalizedError{
        case badUrlResponse
        case unknown
        var errorDescription: String? {
            switch self{
            case .badUrlResponse: return "BadUrl"
            case .unknown: return "unknown"
                
            }
            
        }
        
    }
    static func download(url: URL ) -> AnyPublisher<Data,Error>{
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on:DispatchQueue.global(qos: .default))
            .tryMap({try handleUrlResponse(output: $0)
            })
            .receive(on: DispatchQueue.main)
        //decode data
            .eraseToAnyPublisher()
        
        
    }
    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            print("bad server")
            throw networkingError.badUrlResponse
            
              }
        return output.data
        
    }
    static func handleCompeltion(completion:Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Hata ile karşılaşıldı, hata: \(error)")
        }
        
        
    }
    
}
