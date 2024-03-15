//
//  CoinRowView.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 7.11.2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin:CoinModel
    let showHoldingsCalm: Bool
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingsCalm == true{
                centerColumn
            
            }
            rightColumn
        }
        .font(.subheadline)
        
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin,showHoldingsCalm: true)
                .previewLayout(.sizeThatFits)
            CoinRowView(coin: dev.coin, showHoldingsCalm: true).previewLayout(.sizeThatFits).preferredColorScheme(.dark)
        }
    }
    
}
extension CoinRowView{
    private var leftColumn: some View{
        HStack(spacing: 0) {
            Text("\(coin.rank)").font(.caption).foregroundColor(Color.theme.SecondaryText).frame(minWidth: 40)
            
         CoinImageView(coin: coin)
                .frame(width: 30, height: 30 )
            Text(coin.symbol ?? "net").font(.headline).fontWeight(.heavy).padding(.leading , 6)
                .foregroundColor(Color.theme.accent)
            
        }
        
    }
    private var centerColumn: some View{
        VStack{
            
            Text(coin.currentHoldingsValue.asCurrencyWith6())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }.foregroundColor(Color.theme.accent )
        
        
        
    }
    private var rightColumn: some View{
        
        VStack(alignment: .trailing){
            Text(coin.current_price.asCurrencyWith6())
            
            
            Text((coin.price_change_percentage_24h?.asPercentString() ?? "" ) ).font(.caption).foregroundColor((coin.price_change_percentage_24h ?? 0) >= 0 ?
                                                                                                            Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5 , alignment: .trailing)
        
    }
}
