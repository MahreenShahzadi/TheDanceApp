//
//  HomeVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 15/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit
import SideMenu

class HomeVC: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    
    var videoView:UIView?
    let array = ["Lesson 1","Lesson 2","Lesson 3","Lesson 4","Lesson 5","Lesson 6","Lesson 7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sideBar()
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
       self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
//        let value = UIInterfaceOrientation.landscapeLeft.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }

    func sideBar()
    {
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        
        
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        SideMenuManager.default.menuWidth = 240
        SideMenuManager.default.menuAnimationFadeStrength = 0.4
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
    
    }
    
}
extension HomeVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
        
        
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "VideoSectionTblVC") as? VideoSectionTblVC
            self.navigationController?.pushViewController(VC!, animated: true)
    }
    }
   
}

extension HomeVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeVCCell
        
        cell.cellNameLbl.text = array[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
        
    }
    
}
