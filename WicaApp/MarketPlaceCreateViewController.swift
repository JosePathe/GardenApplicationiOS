//
//  MarketPlaceCreateViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 30/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import Alamofire

class MarketPlaceCreateViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    @IBOutlet weak var quantityOfferTxtField: UITextField!
    @IBOutlet weak var vegetableOfferTxtField: UITextField!
    @IBOutlet weak var quantitySellTxtField: UITextField!
    @IBOutlet weak var vegetableSellTxtField: UITextField!
    @IBOutlet weak var CreateButton: UIButton!
    @IBOutlet weak var titleTxtField: UITextField!
    
    var ParcelArray: [Parcel]! = [Parcel]()
    var ParcelHasVegetablesArray: [Parcelhasvegetables]! = [Parcelhasvegetables]()
    var VegetableArray: [Vegetable]! = [Vegetable]()
    var AllVegetablesArray: [Vegetable]! = [Vegetable]()
    
    
    var parcelObject:Parcel = Parcel(json: nil)
    
    var selectedVegetable:Int = 0
    var selectedVegetable2:Int = 0
    var already:Bool = false
    var quantityOffer:Int = 0
    var quantitySell:Int = 0
    var titleTroc:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView2.dataSource = self
        self.pickerView2.delegate = self
        
        let parameters : [ String : NSString] = [
            "username": "\("basicUser")",
            "password": "\("basicUser")"
        ]
        
        WebServiceHandler.sharedInstance.connectionLogin(WebServiceHandler.loginConnection, parameters: parameters, completionHandler: ({(response) -> Void in
            WebServiceHandler.sharedInstance.getAllParcels({(response) -> Void in
                let array:NSArray = response
                for element in array {
                    let parcel: Parcel = Parcel(object: element)
                    if parcel.parcelRefUser == 6{
                        
                        self.parcelObject.parcelId = parcel.parcelId
                        self.parcelObject.parcelRefGarden = parcel.parcelRefGarden
                    }
                }
                WebServiceHandler.sharedInstance.getAllParcelHasVegetables({(response) -> Void in
                    let array:NSArray = response
                    for element in array {
                        let parcelHasVegetables: Parcelhasvegetables = Parcelhasvegetables(object: element)
                        if parcelHasVegetables.parcelHasVegetableParcel == self.parcelObject.parcelId{
                            print(element)
                            self.ParcelHasVegetablesArray.append(parcelHasVegetables)
                        }
                    }
                    WebServiceHandler.sharedInstance.getAllVegetables({(response) -> Void in
                        let array:NSArray = response
                        for id in self.ParcelHasVegetablesArray{
                            for element in array {
                                let vegetables: Vegetable = Vegetable(object: element)
                                if self.already == false{
                                    print(element)
                                    self.AllVegetablesArray.append(vegetables)
                                }
                                if vegetables.vegetableId ==  id.parcelHasVegetableVegetable!{
                                    self.VegetableArray.append(vegetables)
                                }
                            }
                            self.already = true
                        }
                        self.pickerView.reloadAllComponents()
                        self.pickerView2.reloadAllComponents()
                    })
                })
            })
        }))
        pickerView.hidden = true
        vegetableOfferTxtField.resignFirstResponder()
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.pickerView{
            return self.VegetableArray.count
        }
        if pickerView == self.pickerView2{
            return self.AllVegetablesArray.count
        }
        else{
            return 0
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.pickerView{
            let vegetableItem:Vegetable = self.VegetableArray[row]
            return vegetableItem.vegetableName! as String
        }
        if pickerView == self.pickerView2{
            let vegetableItem:Vegetable = self.AllVegetablesArray[row]
            return vegetableItem.vegetableName! as String
        }
        else{
            return "ERROR"
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.pickerView{
            self.selectedVegetable = row
            let vegetableItem:Vegetable = self.VegetableArray[row]
            self.vegetableOfferTxtField.text = vegetableItem.vegetableName
        }
        if pickerView == self.pickerView2{
            self.selectedVegetable2 = row
            let vegetableItem:Vegetable = self.AllVegetablesArray[row]
            self.vegetableSellTxtField.text = vegetableItem.vegetableName
        }
        else{
            return
        }
    }
    
    
    @IBAction func CreateButtonAccept(sender: UIButton) {
        if checkFields() {
            let vegetableOffer:Vegetable = self.VegetableArray[self.selectedVegetable]
            let vegetableSell:Vegetable = self.AllVegetablesArray[self.selectedVegetable]
            
            let parameters = [
                "troc_user_sell": "\("4")",
                "troc_description": "\(self.titleTxtField.text!)",
                "troc_user_accept": 0,
                "troc_ref_vegetable_offer": "\(vegetableOffer.vegetableId!)",
                "troc_quantity_offer": "\(self.quantityOffer)",
                "troc_ref_vegetable_wanted": "\(vegetableSell.vegetableId!)",
                "troc_quantity_wanted": "\(self.quantitySell)",
                "garden_id": "\(self.parcelObject.parcelRefGarden!)"
            ]
            
            print("parameters = ", parameters)
            
            WebServiceHandler.sharedInstance.addTroc(WebServiceHandler.allTrocsUrl, key: "nAo86Q_Lt7om3DWBxe1XvDJX6iqJvSL4", parameters: parameters as! [String : AnyObject])
        }
    }
    
    
    func checkFields() -> Bool {
        let quantityOfferString:String = self.quantityOfferTxtField.text!
        let quantitySellString:String = self.quantitySellTxtField.text!
        let titleString:String = self.titleTxtField.text!
        let vegetableSell:Vegetable = self.AllVegetablesArray[self.selectedVegetable2]
        let vegetableOffer:Vegetable = self.VegetableArray[self.selectedVegetable]
        
        // Check quantity input is an Int value
        if let value = Int(quantityOfferString) {
            self.quantityOffer = value
        } else {
            let alert = UIAlertController(title: "Erreur", message: "Quantité invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        
        if let value = Int(quantitySellString) {
            self.quantitySell = value
        } else {
            let alert = UIAlertController(title: "Erreur", message: "Quantité invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        
        if titleString == ""{
            let alert = UIAlertController(title: "Erreur", message: "Titre invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        
        // Check one vegetable is selected
        if vegetableOffer.vegetableId == nil {
            let alert = UIAlertController(title: "Erreur", message: "Légume invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        
        if vegetableSell.vegetableId == nil {
            let alert = UIAlertController(title: "Erreur", message: "Légume invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func TxtFieldSellEditingDidBegin(sender: UITextField) {
        pickerView2.hidden = false
        pickerView.hidden = true
        view.endEditing(true)
    }
    @IBAction func TxtFieldSellEditingDidEnd(sender: UITextField) {
        pickerView2.hidden = true
        pickerView.hidden = true
        view.endEditing(true)
    }
    @IBAction func TxtFieldSellTouchDown(sender: UITextField) {
        pickerView2.hidden = false
        pickerView.hidden = true
        view.endEditing(true)
    }
    @IBAction func TxtFieldSellTouchDownRepeat(sender: UITextField) {
        pickerView2.hidden = false
        pickerView.hidden = true
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func TxtFieldEditingDidBegin(sender: UITextField) {
        pickerView.hidden = false
        pickerView2.hidden = true
        view.endEditing(true)
    }
    @IBAction func TxtFieldEditingDidEnd(sender: UITextField) {
        pickerView.hidden = true
        pickerView2.hidden = true
        view.endEditing(true)
    }
    @IBAction func TxtFieldToucheDown(sender: UITextField) {
        pickerView.hidden = false
        pickerView2.hidden = true
        view.endEditing(true)
    }
    @IBAction func TxtFieldTouchDownRepeat(sender: UITextField) {
        pickerView.hidden = false
        pickerView2.hidden = true
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func TxtFieldQuantityOfferEditDidBegin(sender: UITextField) {
        pickerView.hidden = true
        pickerView2.hidden = true
        view.endEditing(false)
    }
    @IBAction func TxtFieldQuantityOfferEditDidEnd(sender: UITextField) {
        pickerView.hidden = true
        pickerView2.hidden = true
        view.endEditing(true)
    }
    
    
    
    @IBAction func TxtFieldQuantitySellEditDidBegin(sender: UITextField) {
        pickerView.hidden = true
        pickerView2.hidden = true
        view.endEditing(false)
    }
    @IBAction func TxtFieldQuantitySellEditDidEnd(sender: UITextField) {
        pickerView.hidden = true
        pickerView2.hidden = true
        view.endEditing(true)
    }
    
    
    
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let gardenListViewController = segue.destinationViewController as! GardenListViewController
     
     }*/
    
}