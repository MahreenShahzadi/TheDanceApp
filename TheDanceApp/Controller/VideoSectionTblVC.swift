//
//  VideoSectionTblVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 16/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class VideoSectionTblVC: UIViewController {

    
    @IBOutlet weak var viewForPopUp: UIView!
    @IBOutlet weak var sectionTblView: UITableView!
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let hidePopUpTap = UITapGestureRecognizer(target: self, action: #selector(self.handelPopUpView(_:)))
        viewForPopUp.addGestureRecognizer(hidePopUpTap)
        viewForPopUp.isUserInteractionEnabled = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
               
    }
    
    
    @objc func handelPopUpView(_ sender: UITapGestureRecognizer) {
        
        viewForPopUp.alpha = 0
        
    }
    
    @IBAction func getPremimBtn(_ sender: Any) {
        
        
        
    }
   
    
    @IBAction func backBtnClk(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
extension VideoSectionTblVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BillieJean_main_VC") as! BillieJean_main_VC
            navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
           viewForPopUp.alpha = 1
        }
        
    }
}

extension VideoSectionTblVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  VideoSectionTblVCCell
         cell.selectionStyle = .none
        
        if indexPath.row != 0
        {
            cell.contentView.alpha = 0.5
        }
        else
        {
            cell.contentView.alpha = 1.0
        }
        
        return cell
    }
 
}
