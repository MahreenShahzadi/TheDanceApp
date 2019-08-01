//
//  EditprofileVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 16/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class EditprofileVC: UIViewController {

    @IBOutlet weak var changePassPopUp: UIView!
    @IBOutlet weak var viewForChangePass: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        let hideChangePassPopUpTap = UITapGestureRecognizer(target: self, action: #selector(self.handelChangePass(_:)))
        viewForChangePass.addGestureRecognizer(hideChangePassPopUpTap)
        viewForChangePass.isUserInteractionEnabled = true
        
    }
    
    @objc func handelChangePass(_ sender: UITapGestureRecognizer) {
        
        viewForChangePass.alpha = 0
        
    }
  
    
    @IBAction func changePassBtnClick(_ sender: Any) {
        
        viewForChangePass.alpha = 1
    }
    
    @IBAction func backBtnClk(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
