//
//  TermsAndServiceViewController.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class TermsAndServiceViewController: UIViewController {
    
    @IBOutlet weak var nextBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func agreeToTermsAndConditionsSwitchValueChanged(_ sender: Any) {
        nextBarButton.isEnabled = (sender as! UISwitch).isOn
    }
    
    @IBAction func nextBarButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Constants.SegueIdentifiers.termsAndServiceToAccountInfoSegue, sender: nil)
    }
}
