//
//  LocalFileManager.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 19.12.2023.
//

import Foundation
import SwiftUI

class LocalFileManager{
    static let instance = LocalFileManager()
    private init(){}
    func saveImage(image: UIImage, imageName: String, folderName: String){
        //Dosya oluşturma
        CreateFolderIfNeeded(folderName: folderName)
        //foroğraf için path alma
        guard let data = image.pngData(),
                
                let url = getUrlForImage(imageName: imageName, folderName: folderName)
        else{return}
    //fotoğrafı pathe kayıt etme
        do{
            
            try data.write(to:url)//datayı saveliyoruz
            
            
        }
        catch let error {
            print("error saving image \(imageName) nd \(error)")
            
            
        }
        
        
    }
    func getImage(imageName: String, folderName: String ) -> UIImage?{
        guard let url = getUrlForImage(imageName: imageName, folderName: folderName),
                FileManager.default.fileExists(atPath: url.path) else{
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    private func CreateFolderIfNeeded(folderName:String){
        guard let url = getUrlForFolder(folderName: folderName) else{return}
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("error creating fn\(folderName) dir\(error)")
            }
        }
        
    }
    private func getUrlForFolder(folderName:String) -> URL?{
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else{ //folder oluşturuyoruz
            
            return nil
            
        }
        return url.appendingPathComponent(folderName)
        
        
    }
    private func getUrlForImage(imageName: String, folderName:String) -> URL?{
        guard let folderUrl = getUrlForFolder(folderName: folderName)
        else{return nil}
        return folderUrl.appendingPathComponent(imageName + ".png")
        
    }
    
}
