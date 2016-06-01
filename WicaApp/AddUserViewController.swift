//
//  AddUserViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 11/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit
import Alamofire

class AddUserViewController: UIViewController {
    // UI items
    
    @IBOutlet weak var field_birthdate: UIDatePicker!
    @IBOutlet weak var field_confirm_password: UITextField!
    @IBOutlet weak var field_password: UITextField!
    @IBOutlet weak var field_username: UITextField!
    @IBOutlet weak var field_adress: UITextField!
    @IBOutlet weak var field_firstname: UITextField!
    @IBOutlet weak var field_name: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Button style
        self.registerButton.layer.cornerRadius = 4;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Click listeners
    
    @IBAction func onClickRegisterButton(sender: AnyObject) {
        if (field_password.text == field_confirm_password.text){
            
            // Modify date format
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let selectedDate = dateFormatter.stringFromDate(field_birthdate.date)
            
            // Send parameters
            let parameters : [ String : NSString] = [
                "username": "\(field_username.text!)",
                "password": "\(field_password.text!)",
                "email": "\(field_adress.text!)",
                "lastname": "\(field_name.text!)",
                "firstname": "\(field_firstname.text!)",
                "date_birth": "\(selectedDate)"
            ]
            
            WebServiceHandler.sharedInstance.addUser(WebServiceHandler.allUsersUrl, parameters: parameters)
        }
        else{
            
            let alert = UIAlertController(title: "Erreur", message: "Les mots de passe ne sont pas les mêmes", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
