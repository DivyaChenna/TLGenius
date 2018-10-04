//
//  Utils.swift
//  TLGenius
//
//  Created by Apple on 8/9/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SystemConfiguration

class Utils {
    
    
    
    /**
     Function call to show the alert in the given viewcontroller
     
     - parameter title:      title of the alert
     - parameter message:    message of the alert
     - parameter controller: controller on which to show
     */
    
    class func showAlertWithTitleInController(_ title:String , message:String,controller:UIViewController)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        if kSharedAppDelegate.window?.rootViewController?.presentedViewController != nil {
            //Present the alert view on the current presented view controller
            kSharedAppDelegate.window?.rootViewController?.presentedViewController?.present(alertController, animated: true, completion: nil)
            
        }else {
            controller.present(alertController, animated: true, completion: nil)
        }
        
    }
    

    
}
