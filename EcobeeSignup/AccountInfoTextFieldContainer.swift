//
//  AccountInfoTextFieldContainer.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-18.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class AccountInfoTextFieldContainer: UIView {
    var contentView: UIView?
    var textField: UITextField?
    var titleLabel: UILabel?
    
    var textTag: TextTag?
    
    weak var delegate: TextFieldContainerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        contentView = Bundle.main.loadNibNamed("AccountInfoTextFieldContainer", owner: self, options: nil)?.first as? UIView
        contentView!.frame = bounds
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.addSubview(contentView!)
        titleLabel = contentView!.viewWithTag(4) as? UILabel
        textField = contentView!.viewWithTag(5) as? UITextField
        textField?.delegate = self
    }
}

extension AccountInfoTextFieldContainer {
    func configureFrom(accountInfosField: AccountInfoFields) {
        titleLabel?.text = accountInfosField.title
        textTag = accountInfosField.rawValue
        textField?.isSecureTextEntry = accountInfosField.shouldHideText
    }
}

extension AccountInfoTextFieldContainer: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedTextString = String((textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString)
        guard let textTag = textTag else {
            return true
        }
        delegate?.textUpdated(textTag: textTag, new: updatedTextString)
        return true
    }
}
