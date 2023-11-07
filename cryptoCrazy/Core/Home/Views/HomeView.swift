//
//  HomeView.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 5.11.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var portfolio: Bool = false
    var body: some View {
        ZStack{
            Color.theme.BackGround.ignoresSafeArea()
            
            VStack{
               
               homeHeader
                Spacer(minLength: 0)
            }
            
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
        }
       
    }
}
extension HomeView {
    private var homeHeader: some View{
        
        HStack{
            
            CircleButtonView(iconName: portfolio ? "plus": "info").animation(.none).background{
                circleButtonAnimationView(animate: $portfolio)
            }
            Spacer()
            Text(portfolio ?"Portfolio ": "Live Prices").font(.headline).fontWeight(.heavy).foregroundColor(Color.theme.accent).animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right").rotationEffect(Angle(degrees: portfolio ? 180 : 0 )).onTapGesture {
                withAnimation(.spring()){//spring efekti uygulama
                    portfolio.toggle()//ters çevirme
                }
            }
        }
    }
}
