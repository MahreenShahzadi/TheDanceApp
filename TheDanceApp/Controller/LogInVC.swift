//
//  LogInVC.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 14/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn
import FacebookCore

class LogInVC: UIViewController,GIDSignInDelegate ,GIDSignInUIDelegate {
    
    

    
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var FbLogInBtn: UIButton!
    @IBOutlet weak var GmailLogInBtn: GIDSignInButton!
    @IBOutlet weak var twitterLogInBtn: UIButton!
    @IBOutlet weak var faceBookLogInBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (AccessToken.current != nil) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            navigationController?.pushViewController(vc, animated: true)
        }
        
  GIDSignIn.sharedInstance()?.delegate = self
        
    
        
      userNameView.layer.cornerRadius = 2
      passView.layer.cornerRadius = 2
      signUpBtn.layer.cornerRadius = 2
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
 
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
//        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 189/255, blue: 20/255, alpha: 1)
    }

    @IBAction func forGotPassBtn(_ sender: Any) {
        
        
    }
    
    
    @IBAction func logInBtnClick(_ sender: Any) {
        
        if (userNameTF.text?.isEmpty)! || (passTF.text?.isEmpty)!{
            
        self.displayMyAlertMessage(userMessage: "Enter Email and Password")
            
        }
        
    
        let  VC = self.storyboard?.instantiateViewController(withIdentifier: "GuidedTourVC") as? GuidedTourVC
        self.navigationController?.pushViewController(VC!, animated: true)
        
    }
    
    @IBAction func signupBtnClick(_ sender: Any) {
        
        let  VC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    @IBAction func fbLoginBtnclick(_ sender: UIButton) {
        
        
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil{
                    if(fbloginresult.grantedPermissions.contains("email")) {
                        self.GetFbUserData()
                    }
                }
            }
        }
    }
    
    func loginButtonDidLogout(_logInBtn: FBLoginButton!){
        
        print("User logOut")
    }
    func GetFbUserData(){
        if((AccessToken.current) != nil){
            
            GraphRequest(graphPath: "me", parameters: ["fields":"id , name,first_name,last_name,picture.type(large),email"]).start(completionHandler:{(conntion , result,error ) -> Void in
                if (error == nil){
                    let faceDic = result as! [String:AnyObject]
                    print(faceDic)
                    let email = faceDic["email"] as! String
                    print(email)
                    let id = faceDic["id"] as! String
                    print(id)
                }
            })
        }
        
    }

    
    @IBAction func gmailLogInBtnClick(_ sender: GIDSignInButton) {
        
       
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
       
      
            }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }

    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                     withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        } else {
            print("\(String(describing: error))")
        }
    }
  
    @IBAction func twitterLogInBtnClick(_ sender: Any) {
        
       
    }
    
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
