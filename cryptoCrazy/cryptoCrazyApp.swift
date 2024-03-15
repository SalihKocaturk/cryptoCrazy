//
//  cryptoCrazyApp.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 5.11.2023.
//

import SwiftUI

@main
struct cryptoCrazyApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView().navigationBarHidden(true)
                
            }.environmentObject(vm)//envoirment object olarak homeviewmodeli ekledik
            
        }
    }
}
