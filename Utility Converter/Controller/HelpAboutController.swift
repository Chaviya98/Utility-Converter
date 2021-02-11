//
//  HelpAboutController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-10.
//

import Foundation
import UIKit

class HelpAboutController: UIViewController {
    
    @IBOutlet weak var headerNavBarSegementController: UISegmentedControl!
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var primaryTextArea: UITextView!
    
    @IBOutlet weak var secondaryTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI(){
        self.headerImageView.layer.masksToBounds = false
        self.headerImageView.layer.cornerRadius = 30
        self.headerImageView.clipsToBounds = true
        
        self.primaryTextArea.text = "\u{2022} Utility Converter App supports speed conventions such as metres/sec, km/hour, miles/hour, nautical miles/hour (knot)."
        self.secondaryTextArea.text = "\u{2022} You can save up to 5 conventions at a time and the history option will list only the last 5 conversions per category."
    }
    
    @IBAction func headerNavBar(_ sender: Any) {
        
        if(headerNavBarSegementController.selectedSegmentIndex == 0)
        {
            headerImageView.image = UIImage(named: "SpeedHome")
            primaryTextArea.text = "\u{2022} Utility Converter App supports speed conventions such as metres/sec, km/hour, miles/hour, nautical miles/hour (knot)."
            secondaryTextArea.text = "\u{2022} You can save up to 5 conventions at a time and the history option will list only the last 5 conversions per category."
        }
        else if(headerNavBarSegementController.selectedSegmentIndex == 1)
        {
            headerImageView.image = UIImage(named: "LengthHome")
            primaryTextArea.text = "\u{2022} Utility Converter App supports length conventions such as metre, km, mile, cm, mm, yard, inch."
            secondaryTextArea.text = "\u{2022} You can save up to 5 conventions at a time and the history option will list only the last 5 conversions per category."
        }else if(headerNavBarSegementController.selectedSegmentIndex == 2)
        {
            headerImageView.image = UIImage(named: "TemperatureHome")
            primaryTextArea.text = "\u{2022} Utility Converter App supports temperature conventions such as Celsius, Fahrenheit, Kelvin."
            secondaryTextArea.text = "\u{2022} You can save up to 5 conventions at a time and the history option will list only the last 5 conversions per category."
        }else if(headerNavBarSegementController.selectedSegmentIndex == 3)
        {
            headerImageView.image = UIImage(named: "VolumeHome")
            primaryTextArea.text = "\u{2022} Utility Converter App supports volume convention such as UK gallon, litre, UK pint, fluid ounce, millilitre."
            secondaryTextArea.text = "\u{2022} You can save up to 5 conventions at a time and the history option will list only the last 5 conversions per category."
        }else if(headerNavBarSegementController.selectedSegmentIndex == 4)
        {
            headerImageView.image = UIImage(named: "WeightHome")
            primaryTextArea.text = "\u{2022} Utility Converter App supports weight conventions such as Kg, grams, ounces, pounds, stone-pounds."
            secondaryTextArea.text = "\u{2022} You can save up to 5 conventions at a time and the history option will list only the last 5 conversions per category."
        }
    }
}
