//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Huang Edison on 2/23/17.
//  Copyright © 2017 Edison. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapSignUpButton(_ sender: Any) {
        let username = emailField.text
        let password = passwordField.text
        var user = PFUser()
        //user["phone"] = "415-392-0202"
        user.username = username
        user.password = password
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                // Show the errorString somewhere and let the user try again.
            } else {
                var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                // Hooray! Let them use the app now.
            }
        }
    }
    
    @IBAction func onTapLogin(_ sender: Any) {
        let username = emailField.text
        let password = passwordField.text
        PFUser.logInWithUsername(inBackground: username!, password: password!, block: { (user, error) -> Void in
            
            // Stop the spinner
            
            if ((user) != nil) {
                //let alert = UIAlertView(title: "Success", message: "Logged In", delegate: self, cancelButtonTitle: "OK")
                //alert.show()
                let chatvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Chat") as! ChatViewController
                chatvc.username = username
                chatvc.password = password
                self.performSegue(withIdentifier: "LoginToChat", sender: nil)
                
                //DispatchQueue.main.async(execute: { () -> Void in
                    //let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Chat")
                    //self.present(viewController, animated: true, completion: nil)
                //})
                
            } else {
                let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        })
        
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }*/
    

}
