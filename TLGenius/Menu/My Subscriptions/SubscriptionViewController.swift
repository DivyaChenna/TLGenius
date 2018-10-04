//
//  SubscriptionViewController.swift
//  TLGenius
//
//  Created by Apple on 8/22/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class SubscriptionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
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
    @IBOutlet weak var addListTblVw: UITableView!
    @IBOutlet weak var menuDotsTblVw: UITableView!

    @IBOutlet weak var addBtn : UIButton!
    @IBOutlet weak var closeBtn : UIButton!
    
    @IBOutlet weak var listShowVw : UIView!
    @IBOutlet weak var elderSelectLbl : UILabel!
    @IBOutlet weak var gasSelectLbl : UILabel!

    @IBOutlet weak var menuDotYConstarint: NSLayoutConstraint!

    var namesArr = [String]()
    var menuNamesArr = [String]()
    var selectedSense : NSString!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuBtn.isSelected = true

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
        
        namesArr = ["    + Band","    + Subscription"]
        menuNamesArr = ["Replace Band","Renew Subscription"]

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
                
                cell.menuDotsBtn.addTarget(self, action: #selector(SubscriptionViewController.menuDotsBtnClicked(sender:)), for: .touchUpInside)
                
                cell.menuDotsBtn.isHidden = false
                cell.bandNameLbl.isHidden = false
                cell.idLbl.isHidden = false

            } else {
                cell.nameIdLbl.text = "Gas"
                
                cell.menuDotsBtn.isHidden = true
                cell.bandNameLbl.isHidden = true
                cell.idLbl.isHidden = true
            }
            
        } else if tableView == addListTblVw {
            cell.nameIdLbl.text = namesArr[indexPath.row]
            cell.nameIdLbl.layer.masksToBounds = true
            cell.nameIdLbl.layer.cornerRadius = 12.0
            
        } else if tableView == menuDotsTblVw {

            cell.nameIdLbl.text = menuNamesArr[indexPath.row]

            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        
        if tableView == addListTblVw {
            listShowVw.isHidden = true
            if indexPath.row == 1 {
                if elderBtn.isSelected == true {
                    selectedSense = "Elder Sense Subscription"
                }
                else if gasBtn.isSelected == true {
                    selectedSense = "Gas Sense Subscription"
                }

                self.performSegue(withIdentifier: "GoToSenseSubscriptinScreen", sender: self)
            }
        }
        else if tableView == menuDotsTblVw {
            listShowVw.isHidden = true
        }
        
     }

    @objc func menuDotsBtnClicked(sender: UIButton!) {
        listShowVw.isHidden = false
        menuDotsTblVw.isHidden = false

        let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to:listShowVw)
        print(buttonPosition)
        
        menuDotYConstarint.constant = buttonPosition.y+50
        addListTblVw.isHidden = true
        closeBtn.isHidden = true
        
        menuDotsTblVw.layer.borderColor = UIColor.lightGray.cgColor
        menuDotsTblVw.layer.borderWidth = 1.0
        menuDotsTblVw.layer.masksToBounds = true
        menuDotsTblVw.layer.cornerRadius = 5.0
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
        listShowVw.isHidden = false
        menuDotsTblVw.isHidden = true
        addListTblVw.isHidden = false
        closeBtn.isHidden = false

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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "GoToSenseSubscriptinScreen" {
            let destinationVC = segue.destination as! GasSenseSubscriptionVC
            print(selectedSense)
            destinationVC.selectedSenseStr = selectedSense! as NSString

        }
        
    }
    

}
