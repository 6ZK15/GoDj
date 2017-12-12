//
//  SignUpView.swift
//  GoDj
//
//  Created by Nehemiah Horace on 12/10/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    //Close Sign Up Form
    func closeSignUpForm(signUpView: UIView) {
        UIView.animate(withDuration: 1, animations: {
             signUpView.transform = CGAffineTransform.init(translationX:
                0, y: signUpView.frame.size.height)
        })
    }
        

}
