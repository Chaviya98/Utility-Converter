//
//  Speed.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-14.
//

import Foundation

class Speed {
    var metresPerSec: Double
    var kmPerHour: Double
    var milesPerHour: Double
    var knotsPerHour: Double

    init(metresPerSec : Double, kmPerHour : Double, milesPerHour: Double, knotsPerHour: Double) {
        self.metresPerSec = metresPerSec
        self.kmPerHour = kmPerHour
        self.milesPerHour = milesPerHour
        self.knotsPerHour = knotsPerHour
    }
    
}
