//
//  SignUpViewController.swift
//  GoDj
//
//  Created by Nehemiah Horace on 12/31/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit
import Eureka
import Firebase
import KeychainSwift
import SwiftPhoneNumberFormatter

class SignUpViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createForm()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createForm() {
        
        form +++ Section("")
        
            // Profile Information
            +++ Section("Profile Information")
            <<< SegmentedRow<String>() { segment in
                segment.options = ["Client", "DJ"]
                segment.tag = "segment"
            }
            <<< NameRow() { row in
                row.title = "First Name"
                row.placeholder = "First Name"
                row.tag = "firstName"
            }
            <<< NameRow() { row in
                row.title = "Last Name"
                row.placeholder = "Last Name"
                row.tag = "lastName"
            }
            <<< TextRow() { row in
                row.title = "Username"
                row.placeholder = "Username"
                row.tag = "username"
            }
            <<< TextRow() { row in
                row.title = "DJ Name"
                row.placeholder = "DJ Name"
                row.tag = "djName"
            }
            <<< EmailRow() { row in
                row.title = "Email"
                row.placeholder = "Email"
                row.tag = "email"
            }
            <<< PasswordRow() { row in
                row.title = "Password"
                row.placeholder = "Password"
                row.tag = "password"
            }
            <<< PasswordRow() { row in
                row.title = "Verify Password"
                row.placeholder = "Verify Password"
                row.tag = "vPassword"
            }
            
            // Security Information
            +++ Section("Security Information")
            <<< PickerInlineRow<String>() { selector in
                selector.title = "Security Question 1"
                selector.options = [
                    "One",
                    "Two",
                    "Three"
                ]
                selector.value = "Select One"
                selector.tag = "sqOne"
            }
            <<< PasswordRow() { row in
                row.title = "Security Answer 1"
                row.placeholder = "Security Answer"
                row.tag = "saOne"
            }
            <<< PickerInlineRow<String>() { selector in
                selector.title = "Security Question 2"
                selector.options = [
                    "One",
                    "Two",
                    "Three"
                ]
                selector.value = "Select One"
                selector.tag = "sqTwo"
            }
            <<< PasswordRow() { row in
                row.title = "Security Answer 2"
                row.placeholder = "Security Answer"
                row.tag = "saTwo"
            }
            <<< PickerInlineRow<String>() { picker in
                picker.title = "Security Question 3"
                picker.options = [
                    "One",
                    "Two",
                    "Three"
                ]
                picker.value = "Select One"
                picker.tag = "sqThree"
            }
            <<< PasswordRow() { row in
                row.title = "Security Answer 3"
                row.placeholder = "Security Answer"
                row.tag = "saThree"
            }
        
        // Optional Information
        +++ Section("Optional Information")
        <<< PhoneRow() { row in
            row.title = "Phone Number"
            row.placeholder = "Phone Number"
            row.tag = "phone"
        }
        <<< PasswordRow() { row in
            row.title = "Password"
            row.placeholder = "Click here to change password"
            row.tag = "passwordB"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
