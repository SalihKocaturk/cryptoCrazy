//
//  HomeView.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 5.11.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var portfolio: Bool = false
    @EnvironmentObject private var vm: HomeViewModel
    var body: some View {
        ZStack{
            Color.theme.BackGround.ignoresSafeArea()
            
            VStack{
                homeHeader
               
                columnTitles //kcuuk baslıklar
               
                
                if !portfolio{
                    
                    allCoinsList
                        .transition(.move(edge: .leading))//yana giderken efektli geçmesini sağlıyot
                }
                if portfolio{
                    portfolioCoinsList.transition(.move(edge: .trailing))//portfolyo coinlerini ve tüm coinleri ayrı gösterioz
                }
                
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
        .environmentObject(dev.homeVM)
    }
}
extension HomeView {
    private var homeHeader: some View{
        
        HStack{
            
            /*CircleButtonView(iconName: portfolio ? "plus": "info").animation(.none).background{
                circleButtonAnimationView(animate: $portfolio)
            }*/
            Spacer()
            Text(portfolio ?"Portfolio ": "Live Prices").font(.headline).fontWeight(.heavy).foregroundColor(Color.theme.accent).animation(.none)
            Spacer()
           /* CircleButtonView(iconName: "chevron.right").rotationEffect(Angle(degrees: portfolio ? 180 : 0 )).onTapGesture {
                withAnimation(.spring()){//spring efekti uygulama
                    portfolio.toggle()//ters çevirme
                }
            }*/
        }
    }
    private var allCoinsList: some View { //allcoinsi view olarak tanımlıyoruz
        List
        {
            ForEach(vm.allCoins){coin in
                CoinRowView(coin: coin, showHoldingsCalm: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(PlainListStyle())//liste stilini değiştiriyor ters değil düz olmasını sağlıyor
        
        
    }
    private var portfolioCoinsList: some View { //allcoinsi view olarak tanımlıyoruz
        List
        {
            ForEach(vm.portfolioCoins){coin in
                CoinRowView(coin: coin, showHoldingsCalm: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(PlainListStyle())//liste stilini değiştiriyor ters değil düz olmasını sağlıyor
        
        
    }
    private var columnTitles: some View{
        
        HStack{
            
            Text("coins")
            Spacer()
            if portfolio{
                Text("holdings")
            }
            
            Text("price")
                .frame(width: UIScreen.main.bounds.width / 3.5 , alignment: .trailing)
                
        }.font(.caption)
            .foregroundColor(Color.theme.SecondaryText)
            .padding(.horizontal)
    }
}
