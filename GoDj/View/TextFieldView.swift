//
//  TextFieldView.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/1/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit

class TextFieldView: UITextField {
    
    let orangeColor = UIColor.init(red: 0.796, green: 0.345, blue: 0.090, alpha: 1.000)
    let whiteColor = UIColor.white
    //
    /*
     * UITextField: Style
     */
    func setTextFieldDesign(textField: UITextField, placeHolderString: String) {
        let font = UIFont(name: "Bodoni 72 Smallcaps", size: 24)!
        let attributes = [
            NSAttributedStringKey.foregroundColor: whiteColor,
            NSAttributedStringKey.font : font
        ]
        textField.layer.cornerRadius = 8
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.textColor = whiteColor
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: attributes)
    }
    
    /*
     * UITextField: Error Style
     */
    func setErrorTextField(textField: UITextField, borderWidth: CGFloat) {
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = whiteColor.cgColor
    }
    
    func resetTextField(textField: UITextField) {
        textField.text = ""
    }

}

