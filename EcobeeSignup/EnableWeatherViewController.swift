//
//  EnableWeatherViewController.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class EnableWeatherViewController: UIViewController {
    
    @IBOutlet weak var enableWeatherSwitch: UISwitch!
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        switch enableWeatherSwitch.isOn {
        case true:
            performSegue(withIdentifier: Constants.SegueIdentifiers.enableWeatherToAddressConfirmationSegue, sender: nil)
        case false:
            performSegue(withIdentifier: Constants.SegueIdentifiers.enableWeatherToCongratulationsSegue, sender: nil)
        }
    }

}
