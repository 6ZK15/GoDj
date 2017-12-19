//
//  SettingsViewController.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/17/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        let menuBtn = UIButton.init(type: UIButtonType.custom)
        menuBtn.setImage(UIImage(named: "menuBtn.png"), for: UIControlState.normal)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        let leftBarButton = UIBarButtonItem(customView: menuBtn)
        navigationItem.setLeftBarButton(leftBarButton, animated: true)
        
        if revealViewController() != nil {
            menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSlideMenu(_ sender: UIBarButtonItem) {
        sideMenu()
    }
    
    func sideMenu() {
        if revealViewController() != nil {
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            print("sidemenu func")
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
