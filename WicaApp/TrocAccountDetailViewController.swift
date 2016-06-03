//
//  TrocAccountDetailViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 03/06/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class TrocAccountDetailViewController: UIViewController {
    @IBOutlet weak var pseudoLabel: UILabel!
    
    @IBOutlet weak var quantitySellLabel: UILabel!
    @IBOutlet weak var vegetableSellLabel: UILabel!
    @IBOutlet weak var quantityOfferLabel: UILabel!
    @IBOutlet weak var vegetableOfferLabel: UILabel!

    // Class attrivutes
    var UserArray: [User]! = [User]()
    var VegetableOfferArray: [Vegetable]! = [Vegetable]()
    var troc:Troc = Troc(json: nil)
    var user:User = User(json: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if user is connected
        if WebServiceHandler.sharedInstance.user?.internalIdentifier == nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let connectionViewController = storyBoard.instantiateViewControllerWithIdentifier("ConnectionViewController") as! ConnectionViewController
            self.presentViewController(connectionViewController, animated: true, completion: nil)
        }
        
        WebServiceHandler.sharedInstance.getUserById(WebServiceHandler.allUsersUrl, userId: Int(troc.trocUserSell!)!, completionHandler: {(response) -> Void in
            self.user = User(object: response)
            
            self.pseudoLabel.text = self.user.username
        })
        
        WebServiceHandler.sharedInstance.getAllVegetables({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let vegetable: Vegetable = Vegetable(object: element)
                self.VegetableOfferArray.append(vegetable)
            }
            for obj in self.VegetableOfferArray{
                if obj.vegetableId! ==
                    Int(self.troc.trocRefVegetableOffer!){
                    self.vegetableOfferLabel.text = obj.vegetableName
                }
                if obj.vegetableId! == Int(self.troc.trocRefVegetableWanted!)!{
                    self.vegetableSellLabel.text = obj.vegetableName
                }
            }
            self.quantityOfferLabel.text = self.troc.trocQuantityOffer
            self.quantitySellLabel.text = self.troc.trocQuantityWanted
        })
        
        
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let gardenListViewController = segue.destinationViewController as! GardenListViewController
     
     }*/

}
