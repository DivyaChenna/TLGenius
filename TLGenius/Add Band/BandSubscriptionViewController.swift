//
//  BandSubscriptionViewController.swift
//  TLGenius
//
//  Created by Apple on 9/5/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class BandSubscriptionViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!

    @IBOutlet weak var laterBtn: UIButton!
    @IBOutlet weak var nowBtn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        laterBtn.layer.cornerRadius = 17.0
        nowBtn.layer.cornerRadius = 17.0

    }

    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sosBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func NotifBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func menuBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func sendRequestBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func homeBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func requestsBtnClicked(sender: UIButton!) {
    }

    @IBAction func laterBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func nowBtnClicked(sender: UIButton!) {
        
//        let vwController = self.navigationController!.viewControllers.last as! SelectBandViewController;
//        vwController.isAlreadySubsribed = "yes"
//        self.navigationController?.popToViewController(vwController, animated: true)
//
//        for selectBandVw : UIViewController in vwController {
//            if selectBandVw .isKind(of: SelectBandViewController.self) {
//            }
//        }

        
        
        let viewControllers = self.navigationController!.viewControllers
        for aViewController in viewControllers
        {
            if aViewController is SelectBandViewController
            {
                let selectBandVw = aViewController as! SelectBandViewController
                selectBandVw.isAlreadySubsribed = "yes"
                _ = self.navigationController?.popToViewController(selectBandVw, animated: true)
            }
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
