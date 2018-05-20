//
//  ViewController.swift
//  RateFlix
//
//  Created by Matt Briselli on 5/15/18.
//  Copyright © 2018 brslli. All rights reserved.
//

import UIKit
import AWSMobileClient
import AWSAuthCore

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.autocorrectionType = UITextAutocorrectionType.yes
        
        
        // Get the AWSCredentialsProvider from the AWSMobileClient
        let credentialsProvider = AWSMobileClient.sharedInstance().getCredentialsProvider()
        
        // Get the identity Id from the AWSIdentityManager
        let identityId = AWSIdentityManager.default().identityId
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

