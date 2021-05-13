//
//  LoginViewController.swift
//  Boilerplate-Mvvm
//
//  Created by Muhammad Ario Bagus on 12/05/21.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn

class LoginViewController: BaseViewController<LoginViewModel> {
    
    // MARK: - Outlet
    @IBOutlet weak var signInEmailView: UIView!
    @IBOutlet weak var signInFacebookView: UIView!
    @IBOutlet weak var signInGoogleView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        
        // Do any additional setup after loading the view.
    }
    func addGesture() {
        
        signInEmailView.isUserInteractionEnabled = true
        signInEmailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSignInEmailPressed(_:))))
        
        signInFacebookView.isUserInteractionEnabled = true
        signInFacebookView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSignInFacebookPressed(_:))))
        
        signInGoogleView.isUserInteractionEnabled = true
        signInGoogleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSignInGooglePressed(_:))))
        
    }
    
    @objc func onSignInFacebookPressed(_ sender: UITapGestureRecognizer){
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if (error != nil){
//                self.showErrorMessageBanner(error!.localizedDescription)
                print("error")

            } else if (result?.isCancelled)!{
            } else if (result?.declinedPermissions.contains("email"))!{
//                self.showErrorMessageBanner(StringConstants.FacebookError.noEmailMessage)
                print("error")
            } else {
                let fbToken = result?.token?.tokenString
                let req = GraphRequest(graphPath: "me", parameters: ["fields":"email, id"], tokenString: fbToken, version: nil, httpMethod: HTTPMethod(rawValue: "GET"))

                _ = req.start(completionHandler: { (connection, result, error) -> Void in
                    if(error == nil) {
                        if let responseDict = result as? [String : AnyObject] {
                            if (responseDict["email"] == nil) {
//                                self.showErrorMessageBanner(StringConstants.FacebookError.noEmailMessage)
                                print("error")
                            } else {
                                guard let token = fbToken, let email = responseDict["email"] as? String, let userId = responseDict["id"] as? String  else {
                                    return
                                }
                                print(token,userId,email)
//                                self.signInPresenter.signInSosmed(token: token, type: .facebook, userid: userId, email: email, isLogin: true)
                                
                            }
                        }
                    } else {
//                        self.showErrorMessageBanner(StringConstants.MessageErrorAPI.tryAgainMessage)
                        print("error")
                    }
                })
            }
        }
    }
    
    @objc func onSignInGooglePressed(_ sender: UITapGestureRecognizer){
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc func onSignInEmailPressed(_ sender: UITapGestureRecognizer){
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
//        if (usernameTextField.text == ""){
//            self.showLabel(label: requireEmailLabel)
//        }
//
//        if (passwordTextField.text == ""){
//            self.showLabel(label: requirePasswordLabel)
//        }
//
//        if (usernameTextField.text != "" && passwordTextField.text != ""){
//            self.delegate?.signInEmail(email: usernameTextField.text!, password: passwordTextField.text!)
//        }
    }
    // MARK: - Navigation


}

// MARK : - GIDSignInDelegate
extension LoginViewController : GIDSignInDelegate {
    // MARK : - GIDSignInDelegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            // For client-side use only!
            if let token = user.authentication.idToken, let email = user.profile.email, let userId =  user.userID {
//                signInPresenter.signInSosmed(token: token, type: .google, userid: userId, email: email, isLogin: true)
                print(token,email,userId)
                print("sukses########")
            }
        } else {
            #if DEBUG_SERVICE_MODE
            print("didSignInForUser error :\(error.localizedDescription)")
            #endif
            if (error.localizedDescription.contains("The user canceled the sign-in flow")) {
                print("didSignInForUser user cancel")
            } else {
//                self.showErrorMessageBanner(error.localizedDescription)
            }
        }
    }
}
