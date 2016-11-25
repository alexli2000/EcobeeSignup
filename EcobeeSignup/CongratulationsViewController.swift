//
//  CongratulationsViewController.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.hidesBackButton = true
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Constants.SegueIdentifiers.congratulationsToLoginSegue, sender: nil)
    }
}
