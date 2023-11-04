//
//  colors.swift
//  cryptoCrazy
//
//  Created by salih kocatürk on 5.11.2023.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = colorTheme()
}
struct colorTheme {
    let accent = Color("AccentColor")
    let BackGround = Color("BackGroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let SecondaryText = Color("SecondaryTextColor")
}
