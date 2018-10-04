//
//  AlertHistoryViewController.swift
//  TLGenius
//
//  Created by Apple on 8/23/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class AlertHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!

    @IBOutlet weak var elderBtn : UIButton!
    @IBOutlet weak var gasBtn : UIButton!
    
    @IBOutlet weak var elderTblVw: UITableView!
    @IBOutlet weak var elderSelectLbl : UILabel!
    @IBOutlet weak var gasSelectLbl : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        menuBtn.isSelected = true
        
        elderSelectLbl.isHidden = false
        gasSelectLbl.isHidden = true
        elderBtn.isSelected = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SenseCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        if elderBtn.isSelected == true {
            cell.nameIdLbl.text = "Emergency Alert for Band Sense"
        } else {
            cell.nameIdLbl.text = "Emergency Alert for Gas Sense"
        }
        
        return cell
    }
    

    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sosBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func NotifBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func homeBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func sendRequestBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func bandBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func requestsBtnClicked(sender: UIButton!) {
    }

    @IBAction func elderBtnClicked(sender: UIButton!) {
        elderSelectLbl.isHidden = false
        gasSelectLbl.isHidden = true
        sender.isSelected = true
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)

        gasBtn.isSelected = false
        elderTblVw.reloadData()
    }
    
    @IBAction func gasBtnClicked(sender: UIButton!) {
        elderSelectLbl.isHidden = true
        gasSelectLbl.isHidden = false
        sender.isSelected = true
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        elderBtn.isSelected = false
        elderTblVw.reloadData()
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
