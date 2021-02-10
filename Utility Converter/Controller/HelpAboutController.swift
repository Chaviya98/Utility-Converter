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
    
    @IBOutlet weak var helpTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        headerImageView.layer.masksToBounds = false
        headerImageView.layer.cornerRadius = 30
        headerImageView.clipsToBounds = true
   
    }
    
    @IBAction func headerNavBar(_ sender: Any) {
        
        if(headerNavBarSegementController.selectedSegmentIndex == 0)
        {
            headerImageView.image = UIImage(named: "SpeedHome")
            helpTextArea.text = ""
        }
        else if(headerNavBarSegementController.selectedSegmentIndex == 1)
        {
            headerImageView.image = UIImage(named: "LengthHome")
            helpTextArea.text = ""
        }else if(headerNavBarSegementController.selectedSegmentIndex == 2)
        {
            headerImageView.image = UIImage(named: "TemperatureHome")
            helpTextArea.text = ""
        }else if(headerNavBarSegementController.selectedSegmentIndex == 3)
        {
            headerImageView.image = UIImage(named: "VolumeHome")
            helpTextArea.text = ""
        }else if(headerNavBarSegementController.selectedSegmentIndex == 4)
        {
            headerImageView.image = UIImage(named: "SpeedHome")
            helpTextArea.text = ""
        }
    }
}
