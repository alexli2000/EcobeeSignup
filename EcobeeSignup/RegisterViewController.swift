//
//  RegisterViewController.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    var code: String = "" {
        didSet {
            enableContinueButton(with: self.code)
        }
    }
    
    @IBOutlet weak var pinTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureViews() {
        configureContinueButton()
        configurePinTextField()
    }
    
    func configureContinueButton() {
        continueButton.layer.borderColor = UIColor.lightGray.cgColor
        continueButton.layer.borderWidth = 1
    }
    
    func configurePinTextField() {
        pinTextField.layer.borderWidth = 1
        pinTextField.text = ""
        pinTextField.layer.borderColor = UIColor.lightGray.cgColor
        pinTextField.backgroundColor = UIColor.clear
        pinTextField.textColor = UIColor.white
        pinTextField.attributedPlaceholder = NSAttributedString(string: "XXXX", attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
    }
    
    func enableContinueButton(with code: String) {
        continueButton.isEnabled = isValidCodeLength(code: code)
    }
    
    private func isValidCodeLength(code: String) -> Bool {
        return code.characters.count == 4
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        sendCode()
    }
    
    func sendCode() {
        PINAPICommunicator().sendPIN(pin: code) { [weak self] (result) in
            if result.isError {
                //TODO: Present alert with error message
                return
            }
            guard let accountCreationToken = result.expectedKey else {
                return
            }
            AccountInfo.sharedInstance.creationToken = accountCreationToken
            DispatchQueue.main.async {
                self?.performSegue(withIdentifier: Constants.SegueIdentifiers.registrationToTermsAndServiceSegue, sender: nil)
            }
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedTextString = String((textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString)
        if updatedTextString.characters.count > 4 {
            return false
        }
        code = updatedTextString
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if continueButton.isEnabled {
            sendCode()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
