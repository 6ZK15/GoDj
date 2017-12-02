//
//  TextFieldView.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/1/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit

class TextFieldView: UITextField {
    
    let colorClass = ColorCode()
    
    /*
     * UITextField: Style
     */
    func setTextFieldDesign(textField: UITextField, placeHolderString: String) {
        let font = UIFont(name: "Baskerville", size: 24)!
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font : font
        ]
        textField.layer.cornerRadius = 8
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.textColor = colorClass.purpleColor
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: attributes)
    }
    
    /*
     * UITextField: Error Style
     */
    func setErrorTextField(textField: UITextField, borderWidth: CGFloat) {
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = colorClass.purpleColor.cgColor
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = colorClass.purpleColor.cgColor
    }
    
    func resetTextField(textField: UITextField) {
        textField.text = ""
    }

}

