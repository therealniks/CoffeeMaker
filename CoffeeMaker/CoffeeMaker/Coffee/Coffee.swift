//
//  Coffee.swift
//  CoffeeMaker
//
//  Created by N!kS on 21.04.2021.
//

import Foundation

enum ConstToppingCosts {
    static var milkTopping = 30.0
    static var syropTopping = 50.0
    static var marshmallowTopping = 55.0
}

protocol Coffee {
    var price: Double { get }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class CoffeeWithMilk: CoffeeDecorator {
    var withMilk: Bool = false
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    convenience init(base: Coffee, withMilk: Bool) {
        self.init(base: base)
        self.base = base
        self.withMilk = withMilk
    }
    var price: Double {
        let price = self.withMilk ? base.price + ConstToppingCosts.milkTopping : base.price
        return price
    }
}

class CoffeeWithSyrop: CoffeeDecorator {

    var base: Coffee
    var withSyrop: Bool = false
    
    required init(base: Coffee) {
        self.base = base
    }
    
    convenience init(base: Coffee, withSyrop: Bool) {
        self.init(base: base)
        self.base = base
        self.withSyrop = withSyrop
    }
    var price: Double {
        let price = self.withSyrop ? base.price + ConstToppingCosts.syropTopping : base.price
        return price
    }
}

class CoffeeWithMarshmallow: CoffeeDecorator {
    var base: Coffee
    var withMarshmallow: Bool = false
    
    required init(base: Coffee) {
        self.base = base
    }
    
    convenience init(base: Coffee,withMarshmallow: Bool) {
        self.init(base: base)
        self.base = base
        self.withMarshmallow = withMarshmallow
    }
    var price: Double {
        let price = self.withMarshmallow ? base.price + ConstToppingCosts.syropTopping : base.price
        return price
    }
}
