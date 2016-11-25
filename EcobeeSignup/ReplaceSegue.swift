//
//  ReplaceSegue.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import UIKit

class ReplaceSegue: UIStoryboardSegue {
    override func perform() {
        source.navigationController?.setViewControllers([destination], animated: true)
    }
}
