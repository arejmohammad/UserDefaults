//
//  ViewController.swift
//  UserDefult1
//
//  Created by Areej Mohammad on 19/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    var fontSize : Int!
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var darkMoodSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.integer(forKey: "fontSize") > 0{
            updateTextSize(defaults.integer(forKey: "fontSize"))
            print(defaults.integer(forKey: "fontSize"))
        } else {
            print(defaults.integer(forKey: "fontSize"))
            fontSize = 30
            defaults.set(fontSize, forKey: "fontSize")
        }
        
        if defaults.bool(forKey: "SwitchState") != false {
            updateSwitch(value: defaults.bool(forKey: "SwitchState") )
            
        } else {
            updateSwitch(value: false)
            print(defaults.bool(forKey: "SwitchState"))
        }
    }

    @IBAction func switchAction(_ sender: Any) {
        updateSwitch(value: (sender as AnyObject).isOn)
}
    func updateSwitch(value : Bool){
        if value {
            defaults.set(true, forKey: "SwitchState")
            overrideUserInterfaceStyle = .dark
            darkMoodSwitch.isOn = true
        } else {
            defaults.set(false, forKey: "SwitchState")
            overrideUserInterfaceStyle = .light
            darkMoodSwitch.isOn = false
        }
        
    }
    func updateTextSize(_ newSize : Int){
        if newSize > 0 {
        fontSize = newSize
        labelText.font = labelText.font.withSize(CGFloat(fontSize))
        defaults.set(fontSize, forKey: "fontSize")
        }
    }
    
    @IBAction func bigFont(_ sender: Any) {
        updateTextSize(defaults.integer(forKey: "fontSize") + 5)

    }
    @IBAction func smallFont(_ sender: Any) {
        updateTextSize(  defaults.integer(forKey: "fontSize") - 5)
    }
}

