//
//  LoginConstraints.swift
//  GoDj
//
//  Created by Nehemiah Horace on 12/14/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit

class LoginConstraints: NSObject {
    
    let mainScreenHeight = UIScreen.main.bounds.size.height
    let mainScreenWidth = UIScreen.main.bounds.size.width
    
    func adjustTextField(textField: UITextField, y: CGFloat) {
        if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7/8 Plus")
            textField.frame.size.width = mainScreenWidth - 80
        } else if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
            
        } else {
            textField.frame.size.width = UIScreen.main.bounds.width - 40
        }
        
        textField.frame.size.height = 46
        textField.center.x = mainScreenWidth/2
        textField.frame.origin.y = y
        
        textField.translatesAutoresizingMaskIntoConstraints = true
        textField.updateConstraints()
    }
    
    func adjustFUTextField(textField: UITextField, y: CGFloat) {
        if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7/8 Plus")
            textField.frame.size.width = mainScreenWidth - 80
        } else if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
            
        } else {
            textField.frame.size.width = mainScreenWidth - 40
        }
        
        textField.center.x = mainScreenWidth/2
        textField.frame.origin.y = y
        textField.frame.size.height = 46
        textField.translatesAutoresizingMaskIntoConstraints = true
        textField.updateConstraints()
    }
    
    func adjustSignInSubmitButton(signInBtn: UIButton, rememberMeSwitch: UISwitch) {
        if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            signInBtn.frame.origin.y = rememberMeSwitch.frame.origin.y + rememberMeSwitch.frame.size.height + 30
            
        } else if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
            signInBtn.frame.origin.y = rememberMeSwitch.frame.origin.y + rememberMeSwitch.frame.size.height + 120
        } else {
            signInBtn.frame.origin.y = rememberMeSwitch.frame.origin.y + rememberMeSwitch.frame.size.height + 60
        }
        
        signInBtn.center.x = mainScreenWidth/2
        signInBtn.translatesAutoresizingMaskIntoConstraints = true
        signInBtn.updateConstraints()
    }
    
    func adjustForgotUsernameSubmitButton(fuSubmitBtn: UIButton, fuSecurityQTF: UITextField) {
        fuSubmitBtn.frame.origin.y = fuSecurityQTF.frame.origin.y + fuSecurityQTF.frame.height + 20
        fuSubmitBtn.center.x = mainScreenWidth/2
        fuSubmitBtn.translatesAutoresizingMaskIntoConstraints = true
        fuSubmitBtn.updateConstraints()
    }
    
    func adjustForgotPasswordSubmitButton(fpSubmitBtn: UIButton, fpInfoLabel: UILabel) {
        fpSubmitBtn.frame.origin.y = fpInfoLabel.frame.origin.y + fpInfoLabel.frame.height + 50
        fpSubmitBtn.center.x = mainScreenWidth/2
        fpSubmitBtn.translatesAutoresizingMaskIntoConstraints = true
        fpSubmitBtn.updateConstraints()
        
        fpInfoLabel.center.x = mainScreenWidth/2
        fpInfoLabel.translatesAutoresizingMaskIntoConstraints = true
        fpInfoLabel.updateConstraints()
    }
    
    
    /*
    func adjustLoginTopMenuButton(_ menuBtn: UIButton) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7/8 Plus")
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7/8")
            menuBtn.frame.origin = CGPoint.init(x: 161, y: 116)
            menuBtn.translatesAutoresizingMaskIntoConstraints = true
            menuBtn.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            menuBtn.frame.origin = CGPoint.init(x: 141, y: 116)
            menuBtn.translatesAutoresizingMaskIntoConstraints = true
            menuBtn.updateConstraints()
        }
    }
    
    func adjustLoginBottomMenuButton(_ menuBtn: UIButton) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            menuBtn.frame.origin = CGPoint.init(x: 161, y: 449)
            menuBtn.translatesAutoresizingMaskIntoConstraints = true
            menuBtn.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            menuBtn.frame.origin = CGPoint.init(x: 141, y: 441)
            menuBtn.translatesAutoresizingMaskIntoConstraints = true
            menuBtn.updateConstraints()
        }
    }
    
    func adjustSubmitButton(_ submitBtn: UIButton) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            submitBtn.frame.origin = CGPoint.init(x: UIScreen.main.bounds.size.width/2 - 40, y: 393)
            submitBtn.translatesAutoresizingMaskIntoConstraints = true
            submitBtn.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            submitBtn.frame.origin = CGPoint.init(x: 121, y: 369)
            submitBtn.translatesAutoresizingMaskIntoConstraints = true
            submitBtn.updateConstraints()
        }
    }
    
    func adjustSignUpSumbitButton(_ submitBtn: UIButton) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            submitBtn.frame.origin = CGPoint.init(x: UIScreen.main.bounds.size.width/2 - 40, y: 404)
            submitBtn.translatesAutoresizingMaskIntoConstraints = true
            submitBtn.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            submitBtn.translatesAutoresizingMaskIntoConstraints = true
            submitBtn.updateConstraints()
        }
    }
    
    func adjustProfileImageView(_ profileImage: UIImageView, _ setProfileBtn: UIButton) {
        
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.layer.borderWidth = 2
//        profileImage.layer.borderColor = orangeColor.cgColor
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
            
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            setProfileBtn.frame.origin = CGPoint.init(x: UIScreen.main.bounds.size.width/2 - 52, y: 106)
            setProfileBtn.translatesAutoresizingMaskIntoConstraints = true
            setProfileBtn.updateConstraints()
            profileImage.frame.origin = CGPoint.init(x: UIScreen.main.bounds.size.width/2 - 85, y: 0)
            profileImage.translatesAutoresizingMaskIntoConstraints = true
            profileImage.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            
        }
    }
    
    func adjustSetProfileImageSubmitBtn(_ submitBtn: UIButton) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
            
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            submitBtn.frame.origin = CGPoint.init(x: UIScreen.main.bounds.size.width/2 - 5, y: 260)
            submitBtn.translatesAutoresizingMaskIntoConstraints = true
            submitBtn.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            
        }
    }
    
    func adjustForgotEmailSubmitButton(_ submitBtn: UIButton) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
            
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            submitBtn.frame.origin = CGPoint.init(x: UIScreen.main.bounds.size.width/2 - 40, y: 260)
            submitBtn.translatesAutoresizingMaskIntoConstraints = true
            submitBtn.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            
        }
    }
    
    func adjustForgotPasswordSubmitButton(_ submitBtn: UIButton) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
            
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            submitBtn.frame.origin = CGPoint.init(x: mainScreenWidth/2 - 40, y: 140)
            submitBtn.translatesAutoresizingMaskIntoConstraints = true
            submitBtn.updateConstraints()
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            
        }
    }
    
    func adjustMenuOptionView(_ menuView: UIView) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
            
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
        }
    }
    
    func adjustRememberSwitch(_ switch: UISwitch) {
        
        if ((mainScreenHeight == 812) && (mainScreenWidth == 375)) {
            print("iPhone X")
            
        } else if ((mainScreenHeight == 736) && (mainScreenWidth == 414)) {
            print("iPhone 6/7 Plus")
            
        } else if ((mainScreenHeight == 667) && (mainScreenWidth == 375)) {
            print("iPhone 6/7")
            
        } else if ((mainScreenHeight == 568) && (mainScreenWidth == 320)) {
            print("iPhone 5/SE")
            
        }
    }
    */
}
