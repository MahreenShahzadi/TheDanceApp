//
//  BillieJean(main)VC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 17/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit
import Swifty360Player
import AVKit

class BillieJean_main_VC: UIViewController {

    @IBOutlet weak var viewFor3DView: Swifty360View!
    @IBOutlet weak var TbleView: UITableView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var viewForFeedPopUp: UIView!
    @IBOutlet weak var viewForInfoPopUp: UIView!
    @IBOutlet weak var infoPopUp: UIView!
    @IBOutlet weak var sideViewBtn: UIButton!
    @IBOutlet weak var animationViewBtn: UIButton!
    @IBOutlet weak var threeDViewBtn: UIButton!
    @IBOutlet weak var faceViewBtn: UIButton!
    
    let array = ["spin","spin","spin","spin"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        sideViewBtn.backgroundColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
        sideViewBtn.setTitleColor(.white , for: .selected)
        sideViewBtn.setTitleColor(.white , for: .selected)
        animationViewBtn.setTitleColor(.white , for: .selected)
        threeDViewBtn.setTitleColor(.white , for: .selected)
        faceViewBtn.setTitleColor(.white , for: .selected)

        progressView.layer.cornerRadius = progressView.frame.width/2
        
        let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "360Video", ofType: "mp4")!)
        let player = AVPlayer(url: videoURL)
        
        let motionManager = Swifty360MotionManager.shared
        self.viewFor3DView.setup(player: player, motionManager: motionManager)
        player.play()
        
        let hideInfoPopUpTap = UITapGestureRecognizer(target: self, action: #selector(self.handelInfo(_:)))
        viewForInfoPopUp.addGestureRecognizer(hideInfoPopUpTap)
        viewForInfoPopUp.isUserInteractionEnabled = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }

    @objc func handelInfo(_ sender: UITapGestureRecognizer) {

        viewForInfoPopUp.alpha = 0

    }

    @IBAction func sideViewBtnClick(_ sender: UIButton) {
        viewFor3DView.alpha = 0
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true{
      
            sideViewBtn.backgroundColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
            sideViewBtn.setTitleColor(.white , for: .normal)
            animationViewBtn.backgroundColor = UIColor.black
            faceViewBtn.backgroundColor = UIColor.black
            threeDViewBtn.backgroundColor = UIColor.black
            sideViewBtn.setTitleColor(.white , for: .normal)
            
        }
        else{
            
            sideViewBtn.backgroundColor = .black
            sideViewBtn.setTitleColor(.white , for: .normal)
        }
    }
    
    @IBAction func animationViewBtnClick(_ sender: UIButton) {
        
        viewFor3DView.alpha = 0
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true{
            
            animationViewBtn.backgroundColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
            animationViewBtn.setTitleColor(.white , for: .normal)
            sideViewBtn.backgroundColor = UIColor.black
            faceViewBtn.backgroundColor = UIColor.black
            threeDViewBtn.backgroundColor = UIColor.black
            animationViewBtn.setTitleColor(.white , for: .normal)
            
        }
        else{
            
            animationViewBtn.backgroundColor = .black
            animationViewBtn.setTitleColor(.white , for: .normal)
        }
        
    }
    
    @IBAction func DViewBtnClick(_ sender: UIButton) {

        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true{
            
            viewFor3DView.alpha = 1
            let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "360Video", ofType: "mp4")!)
            let player = AVPlayer(url: videoURL)
            
            let motionManager = Swifty360MotionManager.shared
            self.viewFor3DView.setup(player: player, motionManager: motionManager)
            player.play()
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(reorientVerticalCameraAngle))
            
            viewFor3DView.addGestureRecognizer(tapGestureRecognizer)
            threeDViewBtn.backgroundColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
            threeDViewBtn.setTitleColor(.white , for: .normal)
            sideViewBtn.backgroundColor = UIColor.black
            faceViewBtn.backgroundColor = UIColor.black
            animationViewBtn.backgroundColor = UIColor.black
            threeDViewBtn.setTitleColor(.white , for: .normal)
            
        }
        else{
            
            threeDViewBtn.backgroundColor = .black
            threeDViewBtn.setTitleColor(.white , for: .normal)
        }
        
    }
    
    @objc func reorientVerticalCameraAngle() {
        viewFor3DView.reorientVerticalCameraAngleToHorizon(animated: true)
    }
    
    @IBAction func faceViewBtnClick(_ sender: UIButton) {
        
        viewFor3DView.alpha = 0
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true{
            
            faceViewBtn.backgroundColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
            faceViewBtn.setTitleColor(.white , for: .normal)
            sideViewBtn.backgroundColor = UIColor.black
            animationViewBtn.backgroundColor = UIColor.black
            threeDViewBtn.backgroundColor = UIColor.black
            faceViewBtn.setTitleColor(.white , for: .normal)
            
        }
        else{
            
            faceViewBtn.backgroundColor = .black
            faceViewBtn.setTitleColor(.white , for: .normal)
        }
        
    }
    
    @IBAction func feedBackBtnClick(_ sender: UIButton) {
        
        viewForFeedPopUp.alpha = 1
        
    }
  
    @IBAction func infoBtnClick(_ sender: Any) {
        
        viewForInfoPopUp.alpha = 1
    }
    
    @IBAction func backBtnClk(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
}

extension BillieJean_main_VC:UITableViewDelegate{
    
    
}

extension BillieJean_main_VC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == TbleView{
        return array.count
        }
        else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == TbleView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TblViewCellVC
        cell.textLbl.text = array[indexPath.row]
        return cell
    }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! notifiTblCellClass
            return cell
        }
    
    }
}
