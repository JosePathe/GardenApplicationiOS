//
//  HelpPlaceDetailsViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 23/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import Alamofire

class HelpPlaceDetailsViewController: UIViewController{
    // UI items
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    // Class attributes
    var help:Help = Help(json: nil)
    var user:User = User(json: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button style
        self.acceptButton.layer.cornerRadius = 4;
        
        // Check if user is connected
        if WebServiceHandler.sharedInstance.user?.internalIdentifier == nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let connectionViewController = storyBoard.instantiateViewControllerWithIdentifier("ConnectionViewController") as! ConnectionViewController
            self.presentViewController(connectionViewController, animated: true, completion: nil)
        }
        
        WebServiceHandler.sharedInstance.getUserById(WebServiceHandler.allUsersUrl, userId: Int(help.helpUser!), completionHandler: {(response) -> Void in
            self.user = User(object: response)
            
            self.pseudoLabel.text = self.user.username
            self.descriptionLabel.text = self.help.helpText
        })
    }
    
    @IBAction func buttonAccept(sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let gardenListViewController = segue.destinationViewController as! GardenListViewController
     
     }*/
    
}