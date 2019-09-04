//
//  BillieJean(main)VC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 17/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit
import AVKit
import DropDown
import AVFoundation


class BillieJean_main_VC: UIViewController {

    @IBOutlet weak var navigMnuBtn: UIBarButtonItem!
    @IBOutlet weak var navigBckBtn: UIBarButtonItem!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var nxtPlyBtn: UIButton!
    @IBOutlet weak var videoPlyrView: UIView!
    @IBOutlet weak var BckPlyBtn: UIButton!
    @IBOutlet weak var TbleView: UITableView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var viewForInfoPopUp: UIView!
    @IBOutlet weak var infoPopUp: UIView!
    @IBOutlet weak var sideViewBtn: UIButton!
    @IBOutlet weak var animationViewBtn: UIButton!
    @IBOutlet weak var threeDViewBtn: UIButton!
    @IBOutlet weak var faceViewBtn: UIButton!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var dropDownBtn: UIButton!
    @IBOutlet weak var lyrClctionView: UICollectionView!
    @IBOutlet weak var sloMotBtn: UIButton!
    @IBOutlet weak var plypusBtn: UIButton!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var stepPlayBtn: UIButton!
    
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
   var wordReader: AVSpeechUtterance!
   let speechSynthesizer = AVSpeechSynthesizer()
    var audioIndex = 0
   // var indexPath = 0
    var previousSelectedIndexPath: IndexPath?
    var toggleState = 1
    
    
    let array = ["Step 1: Form the sides of a pyramid with both your arms At the same time make sure your legs are spread wide. Lets see how that works…","Step 2:  spin your arms round in a circle Make sure you stretch your arms fully and that they move together. If you imagine your arms are hands of a clock, then they should finish at the 10 minutes to 2 clock position. Your head should also look at the sky.Lets see how that works…","Step 3: Bend your arms and knees down at the same time Rotate your feet inwards and bow your head down also.Lets see how that works…","Step 4: Rotate your right leg outwards followed by left leg Return it back to original position afterwards.Lets see how that works…","Step 5: Spread arms and legs out like a starfish and finish Have your head pointing backwards.Lets see how that works…"]
    
    let lyrcArr = ["مش باقي غير أشواقي و سنين عذابي معاك صعبان عليك فراقي صعبان علياانساك","مش باقي غير أشواقي و سنين عذابي معاك صعبان عليك فراقي صعبان علياانساك","و الاصعب كان قراري مهما النيران هتقيد هنساك و ده اختياري و البعد شيء أكيد","و الاصعب كان قراري مهما النيران تقيد هنساك و ده اختياري و البعد شيء اكيد","بكيت عينيا و قسيت عليا مشوار","غرامك هدني","lلمهم اني صحيت ع حلم كان صوته صدى بكيت عينيا و قسيت عليا مشوار","ش باقي غير أشواقي و سنين عذابي معاك صعبان عليك فراقي صعبان عليا"]
    
    let dropDown = DropDown()
    let drpDwn = DropDown()
    var selCellval:Int!
    var nextItem = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speechSynthesizer.delegate = (self as AVSpeechSynthesizerDelegate)
       
        
        lyrClctionView.semanticContentAttribute = .forceRightToLeft
        self.lyrClctionView.isPagingEnabled = true
        
        dropDown.dataSource = ["CHINESE", "SPANISH", "ENGLISH","ARABIC","RUSSIAN"]
        drpDwn.dataSource = ["Lesson 1","Star Fish Moves","Jelly Fish Moves","Sushi fish Moves","Shully Fish Move","EXAM"]
    
        
        searchField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        

                sideViewBtn.backgroundColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
        sideViewBtn.setTitleColor(.white , for: .selected)
        sideViewBtn.setTitleColor(.white , for: .selected)
        animationViewBtn.setTitleColor(.white , for: .selected)
        threeDViewBtn.setTitleColor(.white , for: .selected)
        faceViewBtn.setTitleColor(.white , for: .selected)

        progressView.layer.cornerRadius = progressView.frame.width/2
        
        let hideInfoPopUpTap = UITapGestureRecognizer(target: self, action: #selector(self.handelInfo(_:)))
        viewForInfoPopUp.addGestureRecognizer(hideInfoPopUpTap)
        viewForInfoPopUp.isUserInteractionEnabled = true
        
        
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        
        drpDwn.show()
        drpDwn.width = 368
        drpDwn.backgroundColor = UIColor.black
        drpDwn.textColor = UIColor.white
        
        print("myTargetFunction")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }

    @objc func handelInfo(_ sender: UITapGestureRecognizer) {

        viewForInfoPopUp.alpha = 0

    }
    
    @IBAction func dropDownBtnClk(_ sender: Any) {
        dropDown.show()
        dropDown.direction = .bottom
        dropDown.width = 150
        dropDown.backgroundColor = UIColor.black
        dropDown.textColor = UIColor.white
        dropDown.cellHeight = 30
       // dropDown.textFont = UIFont(name: "OpenSans-Bold", size: 10.0)!
   
    }
    
    @IBAction func bckPlyBtnClk(_ sender: Any) {
        
        let visibleItems: NSArray = self.lyrClctionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        self.nextItem = currentItem.row - 1
        self.lyrClctionView.reloadData()
        if self.nextItem < lyrcArr.count && nextItem >= 0{
            self.lyrClctionView.scrollToItem(at: IndexPath(row: self.nextItem, section: 0), at: .right, animated: true)
        }
    }
    @IBAction func nxtPlyBtnClk(_ sender: Any) {
        
        let visibleItems: NSArray = self.lyrClctionView.indexPathsForVisibleItems as NSArray
                let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
                self.nextItem = currentItem.row + 1
                self.lyrClctionView.reloadData()
                if self.nextItem < lyrcArr.count {
                    self.lyrClctionView.scrollToItem(at: IndexPath(row: self.nextItem, section: 0), at: .left, animated: true)
        
                }
    }
    
    @IBAction func bckBtnClk(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func sideViewBtnClick(_ sender: UIButton) {
        
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
  
    @IBAction func faceViewBtnClick(_ sender: UIButton) {
        
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
    
    @IBAction func infoBtnClick(_ sender: Any) {
        
        viewForInfoPopUp.alpha = 1
    }
    
    @IBAction func backBtnClk(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider)
    {
        
        let seconds : Int64 = Int64(playbackSlider.value)
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        
        player!.seek(to: targetTime)
        
        if player!.rate == 0
        {
           // player?.play()
        }
    }
    
    @IBAction func plyPusBtnClk(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        
        if sender.isSelected == true{
            let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "AnimatedVideo", ofType: "mp4")!)
            let player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoPlyrView.bounds
            self.videoPlyrView.layer.addSublayer(playerLayer)
            player.play()
            plypusBtn.setBackgroundImage(UIImage(named:"pause"), for: .normal)
        }
        else{
            let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "AnimatedVideo", ofType: "mp4")!)
            let player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoPlyrView.bounds
            self.videoPlyrView.layer.addSublayer(playerLayer)
            player.pause()
            plypusBtn.setBackgroundImage(UIImage(named:"play"), for: .normal)
        }
      
        
    }
    
    @IBAction func slomotBtnClk(_ sender: Any) {
        
        print("1")
        var time_observer: NSObject?
                let interval: CMTime = CMTimeMakeWithSeconds(1.0, preferredTimescale: Int32(Double(NSEC_PER_SEC))) // 1 second
                let weakSelf = self //necessary to calm compiler
        time_observer = player!.addPeriodicTimeObserver(forInterval: interval, queue: nil, using: { time in
        
        
            let cur_vid_time: Int = Int(CMTimeGetSeconds(weakSelf.player!.currentTime()))
                    print("vid player time: \(cur_vid_time)")
        
                    //vid will play in slow-mo
                    //beginning at the second second (lol) of the video
                    if cur_vid_time >= 36 {
                        weakSelf.player!.rate = 0.0001
                    } else {
                        weakSelf.player!.rate = 0.0002
                    }
                }) as? NSObject
  
    }
   
    @IBAction func stpPlyBtnClk(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true{
            
            self.audioIndex = 0
            
            BckPlyBtn.isEnabled = false
            nxtPlyBtn.isEnabled = false
            lyrClctionView.isUserInteractionEnabled = false
            sideViewBtn.isUserInteractionEnabled = false
            animationViewBtn.isUserInteractionEnabled = false
            threeDViewBtn.isUserInteractionEnabled = false
            faceViewBtn.isUserInteractionEnabled = false
            searchField.isUserInteractionEnabled = false
            dropDownBtn.isUserInteractionEnabled = false
            plypusBtn.isUserInteractionEnabled = false
            sloMotBtn.isUserInteractionEnabled = false
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            self.navigationItem.leftBarButtonItem?.isEnabled = false
            
           playWord(array[audioIndex])
           
            stepPlayBtn.setBackgroundImage(UIImage(named:"pause-1"), for: .normal)
        } else {
           
            stepPlayBtn.setBackgroundImage(UIImage(named:"play-button"), for: .normal)
            
            BckPlyBtn.isEnabled = true
            nxtPlyBtn.isEnabled = true
            lyrClctionView.isUserInteractionEnabled = true
            sideViewBtn.isUserInteractionEnabled = true
            animationViewBtn.isUserInteractionEnabled = true
            threeDViewBtn.isUserInteractionEnabled = true
            faceViewBtn.isUserInteractionEnabled = true
            searchField.isUserInteractionEnabled = true
            dropDownBtn.isUserInteractionEnabled = true
            plypusBtn.isUserInteractionEnabled = true
            sloMotBtn.isUserInteractionEnabled = true
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            self.navigationItem.leftBarButtonItem?.isEnabled = true

        }
   }
   
    func playWord(_ word: String){
        
        // Read The Word
        wordReader = AVSpeechUtterance(string: word)
        wordReader.rate = 0.5
        wordReader.volume = 1
        speechSynthesizer.speak(wordReader)
        
    }
    
}
extension BillieJean_main_VC:UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TblViewCellVC
      cell.textLbl.text = array[indexPath.row]
        if indexPath.row == audioIndex{
            cell.backgroundColor = UIColor.yellow
        }
      return cell
    }
}

// -----------  UICololection View DATA Source  ---------------------

extension BillieJean_main_VC:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lyrcArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
            as! LyrcCollViewCellVC
            cell.lyrcLbl.text = lyrcArr[indexPath.item]
        
     
        
        if self.nextItem == indexPath.row
                {

                    cell.lyrcLbl.backgroundColor = UIColor.lightGray
                    cell.lyrcLbl.textColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
                  
               // let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "AnimatedVideo", ofType: "mp4")!)
                    
                    let url =  URL(fileURLWithPath: Bundle.main.path(forResource: "AnimatedVideo", ofType: "mp4")!)
                    let playerItem:AVPlayerItem = AVPlayerItem(url: url)
                    player = AVPlayer(playerItem: playerItem)
                    
                    let playerLayer = AVPlayerLayer(player: player!)
                    playerLayer.frame = self.videoPlyrView.bounds
                    self.videoPlyrView.layer.addSublayer(playerLayer)
                   // player?.play()

//                                let player = AVPlayer(url: videoURL)
//                                let playerLayer = AVPlayerLayer(player: player)
//                                playerLayer.frame = self.videoPlyrView.bounds
//                               self.videoPlyrView.layer.addSublayer(playerLayer)
//                                player.play()
 
         let viewWidth = videoPlyrView.frame.width - (plypusBtn.frame.width + sloMotBtn.frame.width)
                    
                    let frm: CGRect = plypusBtn.frame
                   
         let viewBottom =  frm.origin.y
                    print(viewBottom)
    
                    let playbackSlider = UISlider(frame:CGRect(x:20, y:viewBottom, width:viewWidth, height:20))
                    playbackSlider.minimumValue = 0
                    let duration : CMTime = (self.player?.currentItem?.asset.duration)!
                    let seconds : Float64 = CMTimeGetSeconds(duration)
                    playbackSlider.maximumValue = Float(seconds)
                    playbackSlider.isContinuous = true
                    playbackSlider.tintColor = UIColor.green

                    playbackSlider.addTarget(self, action: #selector(BillieJean_main_VC.playbackSliderValueChanged(_:)), for: .valueChanged)
                   // playbackSlider?.addTarget(self, action: #selector(BillieJean_main_VC.playbackSliderValueChanged(_:)), for: .valueChanged)
                    
                    self.videoPlyrView.addSubview(playbackSlider)
                    
                      }
        
                else{

                    cell.lyrcLbl.backgroundColor = UIColor.clear
                    cell.lyrcLbl.textColor = .white

            
//                        let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "AnimatedVideo", ofType: "mp4")!)
//                        let player = AVPlayer(url: videoURL)
//                        let playerLayer = AVPlayerLayer(player: player)
//                        playerLayer.frame = self.videoPlyrView.bounds
//                       self.videoPlyrView.layer.addSublayer(playerLayer)
//                        player.play()
            
                }
        
        return cell
    }
 
}

extension BillieJean_main_VC:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        self.nextItem = indexPath.row
        self.lyrClctionView.reloadData()
        print(nextItem)
    
    }
}
extension BillieJean_main_VC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       let collectionwidth = collectionView.bounds.width
       return CGSize(width: collectionwidth, height: 30)
       //return CGSize(width: collectionwidth/4 - 2, height: collectionwidth/4 - 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
        
    }
}

extension BillieJean_main_VC: AVSpeechSynthesizerDelegate {
    
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {

     audioIndex += 1
    
    DispatchQueue.main.async {
        if (self.audioIndex < self.array.count)
        {
         let indexRow = IndexPath(row: self.audioIndex, section: 0)
         let prevIndexRow = IndexPath(row: self.audioIndex - 1, section: 0)
         self.TbleView.scrollToRow(at: indexRow, at: .bottom, animated: true)
         let currentCell = self.TbleView.cellForRow(at: indexRow) as! TblViewCellVC
         let previousCell = self.TbleView.cellForRow(at: prevIndexRow) as! TblViewCellVC
         currentCell.backgroundColor = UIColor.yellow
         previousCell.backgroundColor = UIColor.clear
        }
    }
   
    print(audioIndex)
    
    if audioIndex != array.count{
        playWord(array[audioIndex])
    }
    
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        
        if characterRange.location == 0
        {
            
        }
        
        print(utterance.speechString)
    }

}
