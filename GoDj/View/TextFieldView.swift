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
            NSAttributedStringKey.foregroundColor: colorClass.whiteColor,
            NSAttributedStringKey.font : font
        ]
        textField.layer.cornerRadius = 8
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.textColor = colorClass.purpleColor
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: attributes)
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 20, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        border.borderColor = colorClass.whiteColor.cgColor
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    /*
     * UITextField: Error Style
     */
    func setErrorTextField(textField: UITextField, borderWidth: CGFloat) {
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = colorClass.whiteColor.cgColor
    }
    
    func resetTextField(textField: UITextField) {
        textField.text = ""
    }

}

