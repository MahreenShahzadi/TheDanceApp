//
//  ProfileVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 16/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
  

    @IBAction func resetPassBtnClk(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditprofileVC") as! EditprofileVC
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
