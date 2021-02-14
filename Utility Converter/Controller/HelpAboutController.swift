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
        
        self.primaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionA", comment: "")
        self.secondaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionB", comment: "")
    }
    
    @IBAction func headerNavBar(_ sender: Any) {
        
        if(headerNavBarSegementController.selectedSegmentIndex == 0)
        {
            headerImageView.image = UIImage(named: "SpeedHome")
            primaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionA", comment: "")
            secondaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionB", comment: "")
        }
        else if(headerNavBarSegementController.selectedSegmentIndex == 1)
        {
            headerImageView.image = UIImage(named: "LengthHome")
            primaryTextArea.text = NSLocalizedString("LengthHelpTextSectionA", comment: "")
            secondaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionB", comment: "")
        }else if(headerNavBarSegementController.selectedSegmentIndex == 2)
        {
            headerImageView.image = UIImage(named: "TemperatureHome")
            primaryTextArea.text = NSLocalizedString("TemperatureHelpTextSectionA", comment: "")
            secondaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionB", comment: "")
        }else if(headerNavBarSegementController.selectedSegmentIndex == 3)
        {
            headerImageView.image = UIImage(named: "VolumeHome")
            primaryTextArea.text = NSLocalizedString("VolumeHelpTextSectionA", comment: "")
            secondaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionB", comment: "")
        }else if(headerNavBarSegementController.selectedSegmentIndex == 4)
        {
            headerImageView.image = UIImage(named: "WeightHome")
            primaryTextArea.text = NSLocalizedString("WeightHelpTextSectionA", comment: "")
            secondaryTextArea.text = NSLocalizedString("SpeedHelpTextSectionB", comment: "")
        }
    }
}
