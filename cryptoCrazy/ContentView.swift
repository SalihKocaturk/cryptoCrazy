//
//  ContentView.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 5.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.BackGround.ignoresSafeArea()
            VStack(spacing:40){
                Text("accentColor").foregroundColor(Color.theme.accent)
                Text("redColor").foregroundColor(Color.theme.red)
                Text("greenColor").foregroundColor(Color.theme.green)
                Text("secondaryTextColor").foregroundColor(Color.theme.SecondaryText)
                
            }
            .font(.headline).fontWeight(.heavy)
            
        }
        
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

