//
//  circleButtonAnimationView.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 7.11.2023.
//

import SwiftUI

struct circleButtonAnimationView: View {
    @Binding var animate:Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.01 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0): .none)
            
    }
}

struct circleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        circleButtonAnimationView(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100,height: 100)
            }
}
