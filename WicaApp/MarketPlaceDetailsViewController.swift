//
//  MarketPlaceDetailsViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 23/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import Alamofire

class MarketPlaceDetailsViewController: UIViewController{
    
    //var trocArray: [Troc]
    
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var quantitySellLabel: UILabel!
    @IBOutlet weak var vegetableSellLabel: UILabel!
    @IBOutlet weak var quantityOfferLabel: UILabel!
    @IBOutlet weak var vegetableOfferLabel: UILabel!
    
    var UserArray: [User]! = [User]()
    var VegetableOfferArray: [Vegetable]! = [Vegetable]()
    
    var troc:Troc = Troc(json: nil)
    var user:User = User(json: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                print(obj.vegetableId)
                if obj.vegetableId! == 10{
                    print(obj.vegetableName)
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
    
    @IBAction func buttonAccept(sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let gardenListViewController = segue.destinationViewController as! GardenListViewController
     
     }*/
    
}