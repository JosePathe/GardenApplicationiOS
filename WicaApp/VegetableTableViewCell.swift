//
//  VegetableTableViewCell.swift
//  WicaApp
//
//  Created by Johann Berthet on 31/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class VegetableTableViewCell: UITableViewCell {
    // UI items
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var vegetableNameLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    // Class attributes
    var delegate:MyCustomCellDelegator!
    var parcelhasvegetables:Parcelhasvegetables!
    var parcelhasvegetablesId:Int = 0
    var parcelhasvegetablesIndex:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Buttons style
        self.plusButton.layer.cornerRadius = 4;
        self.deleteButton.layer.cornerRadius = 4;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Click listeners

    @IBAction func onClickMinusButton(sender: UIButton) {
        let downQuantity:Int = self.parcelhasvegetables.parcelHasVegetableQuantity! - 1
        
        let parameters : [ String : NSString] = [
            "parcel_has_vegetable_id": "\(self.parcelhasvegetables.parcelHasVegetableId!)",
            "parcel_has_vegetable_parcel": "\(self.parcelhasvegetables.parcelHasVegetableParcel!)",
            "parcel_has_vegetable_vegetable": "\(self.parcelhasvegetables.parcelHasVegetableVegetable!)",
            "parcel_has_vegetable_quantity": "\(downQuantity)"
        ]
        
        WebServiceHandler.sharedInstance.updateVegetablesFromParcel(WebServiceHandler.allParcelHasVegetables, id: parcelhasvegetablesId, key: (WebServiceHandler.sharedInstance.user?.authKey)!, parameters: parameters, completionHandler: {(response) -> Void in
                print(response)
                self.delegate.updateParcelhasvegetablesAtIndex(self.parcelhasvegetablesIndex, newQuantity: downQuantity)
                self.delegate.reloadData()
        })
    }
    
    @IBAction func onClickPlusButton(sender: UIButton) {
        let upQuantity:Int = self.parcelhasvegetables.parcelHasVegetableQuantity! + 1
        
        let parameters : [ String : NSString] = [
            "parcel_has_vegetable_id": "\(self.parcelhasvegetables.parcelHasVegetableId!)",
            "parcel_has_vegetable_parcel": "\(self.parcelhasvegetables.parcelHasVegetableParcel!)",
            "parcel_has_vegetable_vegetable": "\(self.parcelhasvegetables.parcelHasVegetableVegetable!)",
            "parcel_has_vegetable_quantity": "\(upQuantity)"
        ]
        
        WebServiceHandler.sharedInstance.updateVegetablesFromParcel(WebServiceHandler.allParcelHasVegetables, id: parcelhasvegetablesId, key: (WebServiceHandler.sharedInstance.user?.authKey)!, parameters: parameters, completionHandler: {(response) -> Void in
                print(response)
                self.delegate.updateParcelhasvegetablesAtIndex(self.parcelhasvegetablesIndex, newQuantity: upQuantity)
                self.delegate.reloadData()
        })
    }
    
    @IBAction func onClickDeleteButton(sender: UIButton) {
        WebServiceHandler.sharedInstance.deleteVegetablesFromParcel(WebServiceHandler.allParcelHasVegetables, id: parcelhasvegetablesId, key: (WebServiceHandler.sharedInstance.user?.authKey)!, completionHandler: {(response) -> Void in
            if response {
                self.delegate.removeParcelhasvegetablesAtIndex(self.parcelhasvegetablesIndex)
                self.delegate.reloadData()
            }
        })
        
    }
}
