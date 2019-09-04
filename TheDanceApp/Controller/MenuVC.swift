//
//  MenuVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 15/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit
import  SideMenu

class MenuVC: UIViewController {

    
    @IBOutlet weak var menutableView: UITableView!
    
    let titleArray = ["Home","Dance Floor","Lesson","profile","Feedback","Badges","Notification","Logout"]
    let imgArray = [#imageLiteral(resourceName: "home_icon"),#imageLiteral(resourceName: "guided_icon"),#imageLiteral(resourceName: "guided_icon"),#imageLiteral(resourceName: "profile_icon"),#imageLiteral(resourceName: "feedback_icon_drawer"),
            #imageLiteral(resourceName: "badges"),#imageLiteral(resourceName: "notification_drawer"),#imageLiteral(resourceName: "logout_drawer")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }

    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
         self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
    
}
extension MenuVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "GuidedTourVC") as? GuidedTourVC
            self.navigationController?.pushViewController(VC!, animated: true)
        }
        
        if indexPath.row == 1 {
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "BillieJean_main_VC") as? BillieJean_main_VC
            self.navigationController?.pushViewController(VC!, animated: true)
            
            
        }
        if indexPath.row == 2 {
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
            self.navigationController?.pushViewController(VC!, animated: true)
        }
       
        if indexPath.row == 3 {
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        
        if indexPath.row == 4 {
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackVC") as? FeedbackVC
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        
        if indexPath.row == 5 {
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "BadgeVC") as? BadgeVC
            self.navigationController?.pushViewController(VC!, animated: true)
           
        }
        
        if indexPath.row == 6 {
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationVC") as? NotificationVC
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        
    }
    
}
extension MenuVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuVCCell
        
        cell.cellNameLbl.text = titleArray[indexPath.row]
        cell.cellImg.image = imgArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
 
}
