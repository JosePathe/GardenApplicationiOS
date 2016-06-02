//
//  MyTrocsAndHelpsViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 23/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import Alamofire

class MyTrocsAndHelpsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewMarket: UITableView!
    
    @IBOutlet weak var segmentControlOffreDemande: UISegmentedControl!
    
    var TrocArray: [Troc]! = [Troc]()
    var HelpArray: [Help]! = [Help]()
    
    var selectedTroc:Int = 0
    var selectedHelp:Int = 0
    
    //var trocArray: [Troc]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewMarket.dataSource = self
        self.tableViewMarket.delegate = self
        
        //Appel WS pour tester le module//
        let parameters : [ String : NSString] = [
            "username": "\("basicUser")",
            "password": "\("basicUser")"
        ]
        
        WebServiceHandler.sharedInstance.connectionLogin(WebServiceHandler.loginConnection, parameters: parameters, completionHandler: ({(response) -> Void in
            WebServiceHandler.sharedInstance.getAllTrocs({(response) -> Void in
                let array:NSArray = response
                for element in array {
                    let troc: Troc = Troc(object: element)
                    if troc.trocUserSell == "4"{
                        print(element)
                        self.TrocArray.append(troc)
                    }
                }
                self.tableViewMarket.reloadData()
            })
            
            WebServiceHandler.sharedInstance.getAllHelps({(response) -> Void in
                let array:NSArray = response
                for element in array {
                    let help: Help = Help(object: element)
                    if help.helpUser! == 4{
                        print(element)
                        self.HelpArray.append(help)
                    }
                }
                self.tableViewMarket.reloadData()
            })
        }))
    }
    
    //////////////////////////////////
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var returnValue = 0
        
        switch(segmentControlOffreDemande.selectedSegmentIndex)
        {
        case 0:
            returnValue = self.TrocArray.count
            break
        case 1:
            returnValue = self.HelpArray.count
            break
        default:
            break
            
        }
        
        return returnValue
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyMarketCell", forIndexPath: indexPath)
        
        switch(segmentControlOffreDemande.selectedSegmentIndex)
        {
        case 0:
            let troc:Troc = self.TrocArray[indexPath.row]
            cell.textLabel?.text = troc.trocDescription
            break
        case 1:
            print("lala")
            let help:Help = self.HelpArray[indexPath.row]
            cell.textLabel?.text = help.helpText
            break
        default:
            break
            
        }
        
        return cell
    }
    @IBAction func SegmentChangedIndex(sender: UISegmentedControl) {
        
        self.tableViewMarket.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch(segmentControlOffreDemande.selectedSegmentIndex)
        {
        case 0:
            selectedTroc = indexPath.row
            self.performSegueWithIdentifier("toTrocDetail", sender: self)
            break
        case 1:
            selectedHelp = indexPath.row
            self.performSegueWithIdentifier("toHelpDetail", sender: self)
            break
        default:
            break
            
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch(segmentControlOffreDemande.selectedSegmentIndex)
        {
        case 0:
            if segue.identifier == "toTrocDetail"{
                let marketPlaceDetailsViewController = segue.destinationViewController as! MarketPlaceDetailsViewController
                marketPlaceDetailsViewController.troc = self.TrocArray[self.selectedTroc]
            }
            else{
                _ = segue.destinationViewController as! MarketPlaceCreateViewController
            }
            break
        case 1:
            if segue.identifier == "toHelpDetail"{
                let helpPlaceDetailsViewController = segue.destinationViewController as! HelpPlaceDetailsViewController
                helpPlaceDetailsViewController.help = self.HelpArray[self.selectedHelp]
            }
            else{
                _=segue.destinationViewController as! HelpPlaceCreateViewController
            }
            break
        default:
            break
            
        }
        
    }
    
}