//
//  CoinRowView.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 7.11.2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin:coinModel
    var body: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)").font(.caption).foregroundColor(Color.theme.SecondaryText).frame(minWidth: 40)
            
            Circle()
                .frame(width: 30, height: 30 )
            Text(coin.symbol ?? "net").font(.headline).fontWeight(.heavy).padding(.leading , 6)
                .foregroundColor(Color.theme.accent)
            Spacer()
            VStack(alignment: .trailing){
                Text("\(coin.currentPrice)")
                
                
                Text((coin.priceChangePercentage24H ?? 0) >= 0 ?  " %\(coin.priceChangePercentage24H ?? 0)": " %\(coin.priceChangePercentage24H ?? 0)").font(.caption).foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ?
                Color.theme.green : Color.theme.red)
            }
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin)
    }
}
