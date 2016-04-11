//
//  AddUserViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 11/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit
import Alamofire

class AddUserViewController: UIViewController {
    // UI items
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Button style
        self.registerButton.layer.cornerRadius = 4;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Click listeners
    @IBAction func onClickRegisterButton(sender: AnyObject) {
        WebServiceHandler.sharedInstance.getAllGardens(WebServiceHandler.allGardensUrl, completionHandler: {(response) -> Void in
            print(response)
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
