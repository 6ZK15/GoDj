//
//  TextFieldView.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/1/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

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
        textField.layer.cornerRadius = 12
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.textColor = colorClass.whiteColor
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: attributes)
        
        let border = CALayer()
        let width = CGFloat(5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height + 3, width:  textField.frame.size.width + 40, height: textField.frame.size.height)
        
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
    
    /*
     * UITextField: Reset Style
     */
    func resetTextField(textField: UITextField) {
        textField.text = ""
        
        let border = CALayer()
        let width = CGFloat(5)
        border.frame = CGRect(x: 20, y: textField.frame.size.height + 3, width:  textField.frame.size.width + 20, height: textField.frame.size.height)
        
        border.borderWidth = width
        border.borderColor = UIColor.clear.cgColor
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
   
    
}
    

