//
//  CommonFunction.swift
//  TheReadingParty
//
//  Created by Coding Pursuits on 14/05/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import Foundation
import UIKit

class CommonFunction:UIViewController{
    
    override func viewDidLoad() {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.displayMyAlertMessage(userMessage: "")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.displayMyAlertMessage(userMessage: "")
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
