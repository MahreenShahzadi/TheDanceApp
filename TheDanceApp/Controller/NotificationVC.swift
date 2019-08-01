//
//  NotificationVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 15/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
}
extension NotificationVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationVcCell
        return cell
    }
    
}
extension NotificationVC:UITableViewDelegate{
    
    
    
}
