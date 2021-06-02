//
//  ViewController.swift
//  CoffeeMaker
//
//  Created by N!kS on 21.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constants {
        static var withDefaultMilk = 1
        static var justnNotGood = 2
    }

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var coffeeTypeSelected: UISegmentedControl!
    @IBOutlet weak var coffeeVolumeSelected: UISegmentedControl!
    @IBOutlet weak var milkSwitch: UISwitch!
    @IBOutlet weak var marshmallowSwitch: UISwitch!
    @IBOutlet weak var syropSwitch: UISwitch!
    
    var simple = SimpleCoffee(type:BaseCoffeeTypePrice.americano, volume: VolumeMultiplier.small)
    
    var coffeeType: BaseCoffeeTypePrice {
        switch coffeeTypeSelected.selectedSegmentIndex {
        case 1:
            return .americano
        case 2:
            return .latte
        case 3:
            return .cappucino
        default:
            return .espresso
        }
    }
    
    var coffeeVolume: VolumeMultiplier {
        switch coffeeVolumeSelected.selectedSegmentIndex {
        case 1:
            return .medium
        case 2:
            return .large
        default:
            return .small
        }
    }
    
    @IBAction func coffeeTypeCheck(_ sender: UISegmentedControl) {
        checkTopping()
        checkVolume()
        self.priceLabel.text = "Price: " + String(checkPrice(coffee: self.simple))
    }
    
    @IBAction func coffeeVolumeCheck(_ sender: UISegmentedControl) {
        self.priceLabel.text = "Price: " +  String(checkPrice(coffee: self.simple))
    }
    
    @IBAction func milkCheck(_ sender: UISwitch) {
        self.priceLabel.text = "Price: " +  String(checkPrice(coffee: simple))
    }
    
    @IBAction func syropCheck(_ sender: UISwitch) {
        self.priceLabel.text = "Price: " +  String(checkPrice(coffee: self.simple))
    }
    @IBAction func toppingCheck(_ sender: UISwitch) {
        self.priceLabel.text = "Price: " +  String(checkPrice(coffee: self.simple))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkVolume()
        self.priceLabel.text = "Price: " +  String(checkPrice(coffee: self.simple))
    }
}

extension ViewController {
    func checkTopping(){
        if coffeeTypeSelected.selectedSegmentIndex > Constants.withDefaultMilk {
            milkSwitch.isEnabled = false
            milkSwitch.isOn = false
        } else {
            milkSwitch.isEnabled = true
        }
        if coffeeTypeSelected.selectedSegmentIndex < Constants.justnNotGood {
            marshmallowSwitch.isEnabled = false
            marshmallowSwitch.isOn = false
        } else {
            marshmallowSwitch.isEnabled = true
        }
    }
    
    func checkVolume() {
        if coffeeTypeSelected.selectedSegmentIndex == 0 {
            coffeeVolumeSelected.isEnabled = false
            coffeeVolumeSelected.selectedSegmentIndex = 0
        } else {
            coffeeVolumeSelected.isEnabled = true
        }
    }
    
    func checkPrice(coffee: Coffee) -> Double {
        let base = SimpleCoffee(type: self.coffeeType, volume: self.coffeeVolume)
        let withMilk = CoffeeWithMilk(base: base, withMilk: self.milkSwitch.isOn)
        let withSyrop = CoffeeWithSyrop(base: withMilk, withSyrop: self.syropSwitch.isOn)
        let withMarshMallow = CoffeeWithMarshmallow(base: withSyrop, withMarshmallow: self.marshmallowSwitch.isOn)
        return withMarshMallow.price
    }
}
