//
//  TCViewController.swift
//  GoDj
//
//  Created by Nehemiah Horace on 12/2/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit
import WebKit

class TCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // IBOutlets
    @IBOutlet weak var checkMarkImg: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeBtn: UIButton!
    
    // Declare Classes
    let colorClass = ColorCode()
    
    // Declare Variables
    var tcMenuNames:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tcMenuNames = ["TERMS OF USE", "E-COMMUNICATIONS", "PRIVACY POLICIES", "CONDITIONAL PENALTIES"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * Loads PDF into webView
     Input: pdfName - String
     */
    func loadPDF(_ pdfName: String) {
        if let pdfURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                view.addSubview(webView)
                
            }
            catch {
                // catch errors here
            }
            
        }
    }
    
    /*
     * UITableView - Delegate and Datasource methods
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tcMenuNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.textColor = colorClass.whiteColor
        cell.textLabel?.font = UIFont(name: "Baskerville", size: 20)!
        cell.textLabel?.text = tcMenuNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        webView.isHidden = false
        closeBtn.isHidden = false
        
        if indexPath.row == 0 {
            loadPDF("contractProposal")
        } else if indexPath.row == 1 {
//            loadPDF("<#T##pdfName: String##String#>")
        } else if indexPath.row == 2 {
//            loadPDF("<#T##pdfName: String##String#>")
        } else if indexPath.row == 3 {
//            loadPDF("<#T##pdfName: String##String#>")
        }
    }
    
    /*
     * @IBAction - selectCheckBox
     Shows check mark & Enables of next button
     */
    @IBAction func selectCheckBox(_ sender: Any) {
        if checkMarkImg.isHidden {
            checkMarkImg.isHidden = false
            nextBtn.isEnabled = true
        } else {
            checkMarkImg.isHidden = true
            nextBtn.isEnabled = false
        }
    }
    
    /*
     * @IBAction - closePDF
     Closes PDF
     */
    @IBAction func closePDF(_ sender: Any) {
        webView.isHidden = true
        closeBtn.isHidden = true
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
