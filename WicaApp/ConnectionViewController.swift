//
//  ConnectionViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 09/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController{
    // UI items
    @IBOutlet weak var field_username: UITextField!
    @IBOutlet weak var field_password: UITextField!
    @IBOutlet weak var button_connection: UIButton!
    @IBOutlet weak var button_signUp: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button style
        self.button_connection.layer.cornerRadius = 4;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickConnectionButton(sender: UIButton) {
    
        if field_password.text != "" && field_username.text != ""{
            
            let parameters : [ String: NSString ] = [
                "username": "\(field_username.text!)",
                "password": "\(field_password.text!)"
            ]
            
            WebServiceHandler.sharedInstance.connectionLogin(WebServiceHandler.loginConnection, parameters: parameters, completionHandler: {(response) -> Void in
                let array:NSDictionary = response
                let currentUserId:Int? = array.objectForKey("id")?.integerValue
                if  let id = currentUserId {
                    // Get current city
                    WebServiceHandler.sharedInstance.getUserById(WebServiceHandler.allUsersUrl, userId: id, completionHandler: {(response) -> Void in
                        WebServiceHandler.sharedInstance.user = User(object: response)
                        self.performSegueWithIdentifier("toAccount", sender: self)
                    })
                } else {
                    let alert = UIAlertController(title: "Erreur", message: "Compte inexistant", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                    }))
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                
            })
            
        }
        else{
            
            let alert = UIAlertController(title: "Erreur", message: "Champs vides", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Button listeners
    
    @IBAction func onClickButtonSignUp(sender: UIButton) {
        self.performSegueWithIdentifier("toCreateAccount", sender: self)
    }
    
    @IBAction func onClickBackButton(sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarController = storyBoard.instantiateViewControllerWithIdentifier("TabBarController") as! UITabBarController
        self.presentViewController(tabBarController, animated: true, completion: nil)
    }
    
    
     // MARK: - Navigation
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     }
    
}