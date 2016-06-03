//
//  HelpAccountDetailViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 03/06/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class HelpAccountDetailViewController: UIViewController {
    
    // UI items
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Class attributes
    var help:Help = Help(json: nil)
    var user:User = User(json: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if user is connected
        if WebServiceHandler.sharedInstance.user?.internalIdentifier == nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let connectionViewController = storyBoard.instantiateViewControllerWithIdentifier("ConnectionViewController") as! ConnectionViewController
            self.presentViewController(connectionViewController, animated: true, completion: nil)
        }
        
        WebServiceHandler.sharedInstance.getUserById(WebServiceHandler.allUsersUrl, userId: Int((WebServiceHandler.sharedInstance.user?.internalIdentifier)!)!, completionHandler: {(response) -> Void in
            self.user = User(object: response)
            
            self.pseudoLabel.text = self.user.username
            self.descriptionLabel.text = self.help.helpText
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let gardenListViewController = segue.destinationViewController as! GardenListViewController
     
     }*/


}
