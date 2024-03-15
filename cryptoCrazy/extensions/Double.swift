//
//  Double.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 7.11.2023.
//

import Foundation


///
///
///
extension Double {//double format fexample : 34.0000.00000 t0 34.0000 (looks better)
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale //default value
        //formatter.currencyCode = "usd" //change currency
        //formatter.currencySymbol = "$" //change currency symbol
        formatter.minimumFractionDigits = 2//min2 after coma
        formatter.maximumFractionDigits = 2//max6 after coma
        return formatter
    }
    // converts a double into a string currency with 2 decimal places
    
    func asCurrencyWith2() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
        
        
        
    }
    
    // converts a double into a currency with 2-6 decimal places

    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale //default value
        //formatter.currencyCode = "usd" //change currency
        //formatter.currencySymbol = "$" //change currency symbol
        formatter.minimumFractionDigits = 2//min2 after coma
        formatter.maximumFractionDigits = 6//max6 after coma
        return formatter
    }
    // converts a double into a string currency with 2-6 decimal places
    
    func asCurrencyWith6() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
        
        
        
    }
    func asNumberString() -> String{
        return String(format: "%.2f", self)
        
        
        
    }
    func asPercentString() -> String{
        return asNumberString() + "%"
        
        
    }
}
