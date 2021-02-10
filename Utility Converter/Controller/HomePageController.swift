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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func btnWeight(_ sender: UIButton) {
        self.nextViewIndexNumber = 0
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnLength(_ sender: UIButton) {
        self.nextViewIndexNumber = 1
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnTemperature(_ sender: UIButton) {
        self.nextViewIndexNumber = 2
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnVolume(_ sender: UIButton) {
        self.nextViewIndexNumber = 3
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnSpeed(_ sender: UIButton) {
        self.nextViewIndexNumber = 4
        self.performSegue(withIdentifier: "tabBarPrimary", sender: self)
    }
    
    @IBAction func btnSetting(_ sender: UIButton) {
        self.nextViewIndexNumber = 0
        self.performSegue(withIdentifier: "tabBarSecondary", sender: self)
    }
    
    
    
}
