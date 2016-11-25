//
//  AccountInfoViewController.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class AccountInfoViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    @IBOutlet var accountTextFields: [AccountInfoTextFieldContainer]!
    
    var registrationInfo: RegistrationInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AccountInfoViewController.dismissKeyboard)))
        registrationInfo = RegistrationInfo()
        configureTextViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(AccountInfoViewController.keyboardWillShow(notif:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AccountInfoViewController.keyboardWillHide(notif:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notif: Notification) {
        if let keyboardSize = (notif.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.scrollView.contentInset.bottom = keyboardSize.height + 30
        }
    }
    
    func keyboardWillHide(notif: Notification) {
        self.scrollView.contentInset.bottom = 0
    }
    
    func configureTextViews() {
        for accountTextField in accountTextFields {
            guard let accuntField = AccountInfoFields(rawValue: accountTextField.tag) else {
                return
            }
            accountTextField.configureFrom(accountInfosField: accuntField)
            accountTextField.delegate = self
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let registrationInfo = registrationInfo else {
            return
        }
        AccountInfo.sharedInstance.registrationInfo = registrationInfo
        CreateAccountAPICommunicator().createAccount(from: AccountInfo.sharedInstance) { [weak self] (result) in
            if result.isError {
                //TODO: Display error
                return
            }
            guard let apiToken = result.expectedKey else {
                return
            }
            AccountInfo.sharedInstance.apiToken = apiToken
            DispatchQueue.main.async {
                self?.performSegue(withIdentifier: Constants.SegueIdentifiers.createAccountToEnableWeatherSegue, sender: nil)
            }
        }
    }
}

extension AccountInfoViewController: TextFieldContainerDelegate {
    internal func textUpdated(textTag: TextTag, new: String) {
        guard let accountField = AccountInfoFields(rawValue: textTag) else {
            return
        }
        guard registrationInfo != nil else {
            return
        }
        switch accountField {
        case .firstName:
            registrationInfo!.firstName = new
        case .lastName:
            registrationInfo!.lastName = new
        case .email:
            registrationInfo!.email = new
        case .password:
            registrationInfo!.password = new
        case .passwordRepeat:
            registrationInfo!.repeatPassword = new
        }
        nextButton.isEnabled = registrationInfo!.isAllValid()
    }
}
