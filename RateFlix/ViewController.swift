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
import AWSPinpoint
import AWSAuthUI

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.autocorrectionType = UITextAutocorrectionType.yes
        
        
        // Get the AWSCredentialsProvider from the AWSMobileClient
        let credentialsProvider = AWSMobileClient.sharedInstance().getCredentialsProvider()
        
        // Get the identity Id from the AWSIdentityManager
        let identityId = AWSIdentityManager.default().identityId
        
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with: self.navigationController!,
               configuration: nil,
               completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                if error != nil {
                    print("Error occurred: \(String(describing: error))")
                } else {
                    // Sign in successful.
                    print("Signed In")
                }
            })
        }
        
    }
    
    func logEvent() {
        
        let pinpointAnalyticsClient =
            AWSPinpoint(configuration:
                AWSPinpointConfiguration.defaultPinpointConfiguration(launchOptions: nil)).analyticsClient
        
        let event = pinpointAnalyticsClient.createEvent(withEventType: "EventName")
        event.addAttribute("DemoAttributeValue1", forKey: "DemoAttribute1")
        event.addAttribute("DemoAttributeValue2", forKey: "DemoAttribute2")
        event.addMetric(NSNumber.init(value: arc4random() % 65535), forKey: "EventName")
        pinpointAnalyticsClient.record(event)
        pinpointAnalyticsClient.submitEvents()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

