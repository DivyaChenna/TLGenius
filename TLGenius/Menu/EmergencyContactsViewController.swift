//
//  EmergencyContactsViewController.swift
//  TLGenius
//
//  Created by Apple on 9/24/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class EmergencyContactsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

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
    @IBOutlet weak var addBtn : UIButton!
    @IBOutlet weak var closeBtn : UIButton!

    @IBOutlet weak var elderTblVw: UITableView!
    
    @IBOutlet weak var elderSelectLbl : UILabel!
    @IBOutlet weak var gasSelectLbl : UILabel!
    @IBOutlet weak var listShowVw : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addBtn.layer.cornerRadius = 25.0
        closeBtn.layer.cornerRadius = 25.0
        addBtn.bringSubview(toFront: self.view)
        
        elderSelectLbl.isHidden = false
        gasSelectLbl.isHidden = true
        elderBtn.isSelected = true

        listShowVw.isHidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SubscriptionViewController.handleTap))
        tap.cancelsTouchesInView = false
        listShowVw?.addGestureRecognizer(tap)
        
    }

    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        listShowVw.isHidden = true
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == elderTblVw {
            return 4
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SenseCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        if tableView == elderTblVw {
            if elderBtn.isSelected == true {
                cell.nameIdLbl.text = "Elder"
            } else {
                cell.nameIdLbl.text = "Gas"
            }
            
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
    
    @IBAction func addBtnClicked(sender: UIButton!) {
        closeBtn.isHidden = false
        listShowVw.isHidden = false
        closeBtn.bringSubview(toFront: listShowVw)

    }
    
    @IBAction func closeBtnClicked(sender: UIButton!) {
        listShowVw.isHidden = true

    }
    
    @IBAction func elderBtnClicked(sender: UIButton!) {
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        elderSelectLbl.isHidden = false
        gasSelectLbl.isHidden = true
        sender.isSelected = true
        gasBtn.isSelected = false
        elderTblVw.reloadData()
        //elderTblVw.isHidden = false
        //gasTblVw.isHidden = true
    }
    
    @IBAction func gasBtnClicked(sender: UIButton!) {
        
        elderSelectLbl.isHidden = true
        gasSelectLbl.isHidden = false
        sender.isSelected = true
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        elderBtn.isSelected = false
        elderTblVw.reloadData()
        //elderTblVw.isHidden = true
        // gasTblVw.isHidden = false
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
