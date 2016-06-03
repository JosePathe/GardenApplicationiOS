//
//  MyTrocsAndHelpsViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 23/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import Alamofire

class MyTrocsAndHelpsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // UI items
    @IBOutlet weak var tableViewMarket: UITableView!
    @IBOutlet weak var segmentControlOffreDemande: UISegmentedControl!
    
    // Class attributes
    var TrocArray: [Troc]! = [Troc]()
    var HelpArray: [Help]! = [Help]()
    var selectedTroc:Int = 0
    var selectedHelp:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewMarket.dataSource = self
        self.tableViewMarket.delegate = self
        
        // Check if user is connected
        if WebServiceHandler.sharedInstance.user?.internalIdentifier == nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let connectionViewController = storyBoard.instantiateViewControllerWithIdentifier("ConnectionViewController") as! ConnectionViewController
            self.presentViewController(connectionViewController, animated: true, completion: nil)
        } else {
            WebServiceHandler.sharedInstance.getAllTrocs({(response) -> Void in
                let array:NSArray = response
                for element in array {
                    let troc: Troc = Troc(object: element)
                    if troc.trocUserSell == "\((WebServiceHandler.sharedInstance.user?.internalIdentifier)!)"{
                        self.TrocArray.append(troc)
                    }
                }
                self.tableViewMarket.reloadData()
            })
            
            WebServiceHandler.sharedInstance.getAllHelps({(response) -> Void in
                let array:NSArray = response
                for element in array {
                    let help: Help = Help(object: element)
                    if help.helpUser! == Int((WebServiceHandler.sharedInstance.user?.internalIdentifier)!){
                        self.HelpArray.append(help)
                    }
                }
                self.tableViewMarket.reloadData()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - TableView Datasource Methods
    
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
            let help:Help = self.HelpArray[indexPath.row]
            cell.textLabel?.text = help.helpText
            break
        default:
            break
            
        }
        
        return cell
    }
    
    
    // MARK: - TableView Delegate Methods
    
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
    
    
    // MARK: - Segment index method
    
    @IBAction func SegmentChangedIndex(sender: UISegmentedControl) {
        
        self.tableViewMarket.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch(segmentControlOffreDemande.selectedSegmentIndex)
        {
        case 0:
            if segue.identifier == "toTrocDetail"{
                let trocAccountDetailViewController = segue.destinationViewController as! TrocAccountDetailViewController
                trocAccountDetailViewController.troc = self.TrocArray[self.selectedTroc]
            }
            else{
                _ = segue.destinationViewController as! TrocAccountDetailViewController
            }
            break
        case 1:
            if segue.identifier == "toHelpDetail"{
                let helpAccountDetailViewController = segue.destinationViewController as! HelpAccountDetailViewController
                helpAccountDetailViewController.help = self.HelpArray[self.selectedHelp]
            }
            else{
                _=segue.destinationViewController as! HelpAccountDetailViewController
            }
            break
        default:
            break
            
        }
        
    }
    
}