//
//  HelpPlaceCreateViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 30/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import Alamofire

class HelpPlaceCreateViewController: UIViewController{
    
    @IBOutlet weak var descTxtField: UITextField!
    @IBOutlet weak var titleTxtField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters : [ String : NSString] = [
            "username": "\("basicUser")",
            "password": "\("basicUser")"
        ]
        
        WebServiceHandler.sharedInstance.connectionLogin(WebServiceHandler.loginConnection, parameters: parameters, completionHandler: ({(response) -> Void in
        }))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onClickCreateButton(sender: UIButton) {
        
        if checkFields() {if checkFields() {
            
            let parameters = [
                "help_user": "\("4")",
                "help_title": "\(titleTxtField.text!)",
                "help_user_accept": "\("")",
                "help_text": "\(descTxtField.text!)",
                ]
            
            print("parameters = ", parameters)
            
            WebServiceHandler.sharedInstance.addHelp(WebServiceHandler.allHelpsUrl, key: "nAo86Q_Lt7om3DWBxe1XvDJX6iqJvSL4", parameters: parameters )
            }
        }
        
    }
    
    func checkFields() -> Bool {
        let titleString:String = self.titleTxtField.text!
        let descString:String = self.descTxtField.text!
        
        if titleString == ""{
            let alert = UIAlertController(title: "Erreur", message: "Titre invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        
        if descString == ""{
            let alert = UIAlertController(title: "Erreur", message: "Description invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        return true
    }
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let gardenListViewController = segue.destinationViewController as! GardenListViewController
     
     }*/
    
}