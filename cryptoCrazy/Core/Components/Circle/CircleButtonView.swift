//
//  CircleButtonView.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 5.11.2023.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        
        Image(systemName:iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50,height: 100)
            .background{
                Circle()
                    .foregroundColor(Color.theme.BackGround)
            }
            .shadow(
                color:  Color.theme.accent.opacity(0.20),
                radius: 10, x:0, y:0)
            .padding()
            
                
            
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            
            CircleButtonView(iconName: "chevron.right").previewLayout(.sizeThatFits)
                
            
            CircleButtonView(iconName: "info").previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        
        }
        
    }
}
