//
//  GuidedTourVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 22/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class GuidedTourVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
    
    @IBAction func guidTourBtnClick(_ sender: Any) {
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "VideoSectionTblVC") as! VideoSectionTblVC
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dFBtnClk(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "BillieJean_main_VC") as! BillieJean_main_VC
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func slctLangBtnClick(_ sender: Any) {
    }
    
    
    @IBAction func abtBtnClk(_ sender: Any) {
        

    }
}
