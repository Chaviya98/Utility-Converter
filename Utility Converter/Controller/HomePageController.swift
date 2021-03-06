//
//  HomePageController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-10.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    // Create a value for chosed view
    private var nextViewIndexNumber = Int()
    
    @IBOutlet weak var btnWeight: UIButton!
    @IBOutlet weak var btnLength: UIButton!
    @IBOutlet weak var btnTemperature: UIButton!
    @IBOutlet weak var btnVolume: UIButton!
    @IBOutlet weak var btnSpeed: UIButton!
    @IBOutlet weak var btnSetting: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingUpTheRoundUpDecimalNumber()
    }
    
    private func setupUI(){
        btnWeight.layer.masksToBounds = false
        btnWeight.layer.cornerRadius = 30
        btnWeight.clipsToBounds = true
        
        btnLength.layer.masksToBounds = false
        btnLength.layer.cornerRadius = 30
        btnLength.clipsToBounds = true
        
        btnTemperature.layer.masksToBounds = false
        btnTemperature.layer.cornerRadius = 30
        btnTemperature.clipsToBounds = true
        
        btnVolume.layer.masksToBounds = false
        btnVolume.layer.cornerRadius = 30
        btnVolume.clipsToBounds = true
        
        btnSpeed.layer.masksToBounds = false
        btnSpeed.layer.cornerRadius = 30
        btnSpeed.clipsToBounds = true
        
        btnSetting.layer.masksToBounds = false
        btnSetting.layer.cornerRadius = 30
        btnSetting.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabBarPrimary" {
            
            let nextViewController = segue.destination as! UITabBarController
            
            switch (nextViewIndexNumber) {
            case 1:
                nextViewController.selectedIndex = 0
                
            case 2:
                nextViewController.selectedIndex = 1
                
            case 3:
                nextViewController.selectedIndex = 2
                
            case 4:
                nextViewController.selectedIndex = 3
                
            case 5:
                nextViewController.selectedIndex = 4
                
            default:
                break
            }
            
        } else if segue.identifier == "tabBarSecondary" {
            
            let nextViewController = segue.destination as! UITabBarController
            
            switch (nextViewIndexNumber) {
            case 1:
                nextViewController.selectedIndex = 0
                
            case 2:
                nextViewController.selectedIndex = 1
                
            default:
                break
            }
            
        }
    }
    
    @IBAction func btnWeightPressed(_ sender: UIButton) {
        self.nextViewIndexNumber = 1
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnLengthPressed(_ sender: UIButton) {
        self.nextViewIndexNumber = 2
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnTemperaturePressed(_ sender: UIButton) {
        self.nextViewIndexNumber = 3
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnVolumePressed(_ sender: UIButton) {
        self.nextViewIndexNumber = 4
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnSpeedPressed(_ sender: UIButton) {
        self.nextViewIndexNumber = 5
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnSettingPressed(_ sender: UIButton) {
        self.nextViewIndexNumber = 1
        self.performSegue(withIdentifier: "tabBarSecondary", sender: self)
    }
    
    
    private func settingUpTheRoundUpDecimalNumber(){
        let defaults = UserDefaults.standard
        defaults.set(Constants.DEFAULT_DECIMAL_ROUND_UP_NUMBER, forKey: StoreKeys.DECIMAL_VALUE_KEY)
    }
}
