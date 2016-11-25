//
//  AddressConfirmationViewController.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

enum AddressFields: Int {
    case streetAddress = 0, city, province, zipCode
}

class AddressConfirmationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var locationManager: LocationManager?
    var addressInfo: AddressInfo?
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = LocationManager { [weak self] (placemark) in
            self?.activityIndicator.stopAnimating()
            self?.addressInfo = AddressInfo(placemark: placemark)
            self?.configureFields()
        }
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AccountInfoViewController.dismissKeyboard)))
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
    
    func configureFields() {
        for field in textFields {
            guard let addressField = AddressFields(rawValue: field.tag) else {
                continue
            }
            switch addressField {
            case .streetAddress:
                field.text = addressInfo?.streetAddress
            case .city:
                field.text = addressInfo?.city
            case .province:
                field.text = addressInfo?.province
            case .zipCode:
                field.text = addressInfo?.zipCode
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let addressInfo = addressInfo else {
            return
        }
        AccountInfo.sharedInstance.addressInfo = addressInfo
        LocationAPICommunicator().saveLocation(from: AccountInfo.sharedInstance)
        performSegue(withIdentifier: Constants.SegueIdentifiers.addressConfirmationToCongratulationsSegue, sender: nil)
    }
}
