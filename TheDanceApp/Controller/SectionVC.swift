//
//  SectionVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 21/08/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class SectionVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
   
    let secNmaeArr = ["Section 1","Section 2","Section 3","Section 4","Section 5","Section 6"]

    @IBOutlet weak var secTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bckBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secNmaeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SectionVCCellTableViewCell
        cell.nameLbl.text = secNmaeArr[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 0{
            
            let  VC = self.storyboard?.instantiateViewController(withIdentifier: "VideoSectionTblVC") as? VideoSectionTblVC
            self.navigationController?.pushViewController(VC!, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
