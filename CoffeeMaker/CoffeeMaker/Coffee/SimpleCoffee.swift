//
//  SimpleCoffee.swift
//  CoffeeMaker
//
//  Created by N!kS on 21.04.2021.
//

import Foundation

class SimpleCoffee: Coffee {
    var price: Double    
    var type: BaseCoffeeTypePrice
    var volume: VolumeMultiplier

    init(type: BaseCoffeeTypePrice, volume: VolumeMultiplier) {
        self.type = type
        self.volume = volume
        self.price = type.rawValue * volume.rawValue
    }
}
