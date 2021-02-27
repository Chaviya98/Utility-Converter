//
//  Temperature.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-13.
//

import Foundation

class Temperature {
    var farenheit : Double
    var celsius : Double
    var kelvin : Double
    
    init() {
        self.farenheit = 0.0
        self.celsius = 0.0
        self.kelvin = 0.0
    }
    
    init(farenheit: Double, celsius: Double,  kelvin: Double) {
        self.farenheit = farenheit
        self.celsius = celsius
        self.kelvin = kelvin
    }
}
