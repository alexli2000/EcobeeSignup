//
//  LoginTextFieldContainer.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-18.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

protocol TextFieldContainerDelegate: class {
    func textUpdated(textTag: TextTag, new: String)
}

class LoginTextFieldContainer: UIView {
    var contentView: UIView?
    var leftImageView: UIImageView?
    var textField: UITextField?
    var textTag: TextTag?
    
    weak var delegate: TextFieldContainerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        contentView = Bundle.main.loadNibNamed("LoginTextFieldContainer", owner: self, options: nil)?.first as? UIView
        contentView!.frame = bounds
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.addSubview(contentView!)
        guard let subview = contentView?.subviews.first else {
            return
        }
        subview.layer.borderColor = UIColor.white.cgColor
        leftImageView = subview.viewWithTag(4) as? UIImageView
        textField = subview.viewWithTag(5) as? UITextField
        textField?.delegate = self
    }
}

extension LoginTextFieldContainer {
    func configureFrom(loginInfo: LoginInfo) {
        leftImageView?.image = UIImage(named: loginInfo.imageName)
        textField?.attributedPlaceholder = NSAttributedString(string: loginInfo.placeholder, attributes: [NSForegroundColorAttributeName : UIColor.gray])
        textTag = loginInfo.rawValue
        textField?.isSecureTextEntry = loginInfo.shouldHideText
    }
}

extension LoginTextFieldContainer: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedTextString = String((textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString)
        guard let textTag = textTag else {
            return true
        }
        delegate?.textUpdated(textTag: textTag, new: updatedTextString)
        return true
    }
}
