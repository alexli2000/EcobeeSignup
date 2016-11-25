//
//  LoginViewController.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldContainer: LoginTextFieldContainer!
    @IBOutlet weak var passwordTextFieldContainer: LoginTextFieldContainer!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        configureTextFields()
    }
    
    func configureTextFields() {
        emailTextFieldContainer.configureFrom(loginInfo: .email)
        emailTextFieldContainer.delegate = self
        passwordTextFieldContainer.configureFrom(loginInfo: .password)
        passwordTextFieldContainer.delegate = self
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Constants.SegueIdentifiers.loginToRegistrationSegue, sender: nil)
    }
}

extension LoginViewController: TextFieldContainerDelegate {
    internal func textUpdated(textTag: TextTag, new: String) {
        guard let loginField = LoginInfo(rawValue: textTag) else {
            return
        }
        switch loginField {
        case .email:
            print("Email edited")
        case .password:
            print("Password edited")
        }
    }
}
