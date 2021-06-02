//
//  CoffeeType.swift
//  CoffeeMaker
//
//  Created by N!kS on 21.04.2021.
//

import Foundation

enum BaseCoffeeTypePrice: Double {
    case espresso  = 100
    case ristretto = 150
    case americano = 200
    case flatWhite = 225
    case latte = 300
    case cappucino = 250
}

enum VolumeMultiplier: Double {
    case small = 1.0
    case medium = 1.15
    case large = 1.25
}
