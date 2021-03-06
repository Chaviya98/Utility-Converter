//
//  Speed.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-14.
//

import Foundation

class Speed : Unit{
    var metresPerSec: Double
    var kmPerHour: Double
    var milesPerHour: Double
    var knotsPerHour: Double
    
   override init() {
        self.metresPerSec = 0.0
        self.kmPerHour = 0.0
        self.milesPerHour = 0.0
        self.knotsPerHour = 0.0
    }

    init(metresPerSec : Double, kmPerHour : Double, milesPerHour: Double, knotsPerHour: Double) {
        self.metresPerSec = metresPerSec
        self.kmPerHour = kmPerHour
        self.milesPerHour = milesPerHour
        self.knotsPerHour = knotsPerHour
    }
    
    
    // creating histroy data
    func getSpeedData() -> String {
        return "\(NSLocalizedString("SpeedHistoryTitleForMetersPerSecond", comment: ""))\(formatTextFieldValue(data: self.metresPerSec))\n" +
            "\(NSLocalizedString("SpeedHistoryTitleForKilometersPerHour", comment: ""))\(formatTextFieldValue(data: self.kmPerHour))\n" +
            "\(NSLocalizedString("SpeedHistoryTitleForMilesPerHour", comment: ""))\(formatTextFieldValue(data: self.milesPerHour))\n" +
            "\(NSLocalizedString("SpeedHistoryTitleForKnots", comment: ""))\(formatTextFieldValue(data: self.knotsPerHour))"
    }
}
