//
//  SignUpVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 15/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit
import Alamofire

class SignUpVC: UIViewController {

    
    @IBOutlet weak var phoneNoTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fnameTF: UITextField!
    @IBOutlet weak var lNameTF: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }
    

    @IBAction func signUpBtnClick(_ sender: Any) {
        
        if (fnameTF.text?.isEmpty)! || (lNameTF.text?.isEmpty)! || (emailTF.text?.isEmpty)! || (passTF.text?.isEmpty)! || (confirmPassTF.text?.isEmpty)! || (phoneNoTF.text?.isEmpty)!
        {
            
           self.displayMyAlertMessage(userMessage: "Fill All Text Fields")
            
        }
    
        let isEmailAddressValid = self.isValidEmailAddress(emailAddressString: emailTF.text!)
        if (emailTF.text?.isEmpty)! || (passTF.text?.isEmpty)!
            
        {
           Alerts.object.displayMyAlertMessage (userMessage: "Enter Email and Password")
        }

        else if !(isEmailAddressValid){
           self.displayMyAlertMessage(userMessage: "Email format is incorrect")
        }
        
        else if !(passTF.text == confirmPassTF.text) {
            
            self.displayMyAlertMessage(userMessage: "Password Are Not Same")
        }
        
        let  VC = self.storyboard?.instantiateViewController(withIdentifier: "GuidedTourVC") as? GuidedTourVC
        self.navigationController?.pushViewController(VC!, animated: true)
        
        }
    
    
    @IBAction func backBtnClick(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
}
    
}
