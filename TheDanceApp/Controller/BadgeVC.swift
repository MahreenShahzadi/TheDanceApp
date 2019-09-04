//
//  BadgeVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 16/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class BadgeVC: UIViewController {

    @IBOutlet weak var badgePopUp: UIView!
    @IBOutlet weak var viewForBadgePopUp: UIView!
    
    var titleArray = ["New look","No Pain, No gain","Going Premium","polyglot","Sociallite badge"]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        let hideBadgePopUpTap = UITapGestureRecognizer(target: self, action: #selector(self.handelLeave(_:)))
        viewForBadgePopUp.addGestureRecognizer(hideBadgePopUpTap)
        viewForBadgePopUp.isUserInteractionEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
   
    @objc func handelLeave(_ sender: UITapGestureRecognizer) {
        
        viewForBadgePopUp.alpha = 0
        
    }
    @IBAction func bckBtnClk(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func crossBtnClk(_ sender: Any) {
        
        viewForBadgePopUp.alpha = 0
        
    }
}

extension BadgeVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
        for: indexPath) as! BadgeVCCell
        cell.badgeLbl.text = titleArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension BadgeVC:UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            viewForBadgePopUp.alpha = 1
            
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
