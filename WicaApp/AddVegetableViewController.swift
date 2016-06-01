//
//  AddVegetableViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 18/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class AddVegetableViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // UI items
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var vegetablePickerView: UIPickerView!
    @IBOutlet weak var addButton: UIButton!
    
    // Class attributes
    var user:User = User(json: nil)
    var parcel:Parcel = Parcel(json: nil)
    var parcelhasvegetables:Parcelhasvegetables?
    var vegetableList: NSMutableArray = []
    var selectedVegetable:Int = 0
    var quantity:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button style
        self.addButton.layer.cornerRadius = 4;

        // Set this ViewController as picker datasource and picker delegate
        self.vegetablePickerView.dataSource = self
        self.vegetablePickerView.delegate = self
        
        // Webservice call
        WebServiceHandler.sharedInstance.getAllVegetables({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let vegetable:Vegetable = Vegetable(object: element)
                self.vegetableList.addObject(vegetable)
            }
            
            self.vegetablePickerView.reloadAllComponents()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PickerView Datasource Methods
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.vegetableList.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - PickerView Delegate Methods
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let vegetable:Vegetable = self.vegetableList[row] as! Vegetable
        return vegetable.vegetableName! as String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedVegetable = row
    }
    
    // MARK: - Click listener

    @IBAction func onClickAddButton(sender: AnyObject) {
        if checkFields() {
            let vegetable:Vegetable = self.vegetableList[self.selectedVegetable] as! Vegetable
            
            print(self.parcel.parcelId!)
            print(vegetable.vegetableId!)
            print(self.quantity)
            
            let parameters = [
                "parcel_has_vegetable_parcel": "\(self.parcel.parcelId!)",
                "parcel_has_vegetable_vegetable": "\(vegetable.vegetableId!)",
                "parcel_has_vegetable_quantity": "\(self.quantity)"
            ]
            
            WebServiceHandler.sharedInstance.addVegetablesToParcel(WebServiceHandler.allParcelHasVegetables, key: user.authKey!, parameters: parameters, completionHandler: {(response) -> Void in
                let dictionary:NSDictionary = response
                let currentParcelhasvegetables = Parcelhasvegetables(object: dictionary)
                let currentParcelhasvegetablesId:Int = currentParcelhasvegetables.parcelHasVegetableId!
                
                // Get current parcelhasvegetables
                WebServiceHandler.sharedInstance.getParcelHasVegetablesById(WebServiceHandler.allParcelHasVegetables, parcelhasvegetablesId: currentParcelhasvegetablesId, completionHandler: {(response) -> Void in
                    let dictionary:NSDictionary = response
                    self.parcelhasvegetables = Parcelhasvegetables(object: dictionary)
                    
                    let parcelAccountDetailViewController:ParcelAccountDetailViewController = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.endIndex)!-2] as! ParcelAccountDetailViewController
                    parcelAccountDetailViewController.parcelhasvegetablesList.append(self.parcelhasvegetables!)
                    parcelAccountDetailViewController.vegetableList.addObject(vegetable)
                    self.navigationController?.popViewControllerAnimated(true)
                })
            })
            
            
        }
    }
    
    func checkFields() -> Bool {
        let quantityString:String = self.quantityTextField.text!
        let vegetable:Vegetable = self.vegetableList[self.selectedVegetable] as! Vegetable
        
        // Check quantity input is an Int value
        if let value = Int(quantityString) {
            self.quantity = value
        } else {
            let alert = UIAlertController(title: "Erreur", message: "Quantité invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        
        // Check one vegetable is selected
        if vegetable.vegetableId == nil {
            let alert = UIAlertController(title: "Erreur", message: "Légume invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }

        return true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let parcelAccountDetailViewController = segue.destinationViewController as! ParcelAccountDetailViewController
        parcelAccountDetailViewController.parcel = self.parcel
        parcelAccountDetailViewController.user = self.user
    }
}
