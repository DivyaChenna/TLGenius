//
//  MyRequestsViewController.swift
//  TLGenius
//
//  Created by Apple on 9/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MyRequestsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    
    @IBOutlet weak var requestBtn : UIButton!
    @IBOutlet weak var allBtn : UIButton!
    
    @IBOutlet weak var requestTblVw: UITableView!
    @IBOutlet weak var addListTblVw: UITableView!

    @IBOutlet weak var addBtn : UIButton!
    @IBOutlet weak var closeBtn : UIButton!
    
    @IBOutlet weak var listShowVw : UIView!
    @IBOutlet weak var requestLbl : UILabel!
    @IBOutlet weak var allLbl : UILabel!

    var namesArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        requestTblVw.tableFooterView = UIView()

        addBtn.layer.cornerRadius = 25.0
        closeBtn.layer.cornerRadius = 25.0
        
        requestLbl.isHidden = false
        allLbl.isHidden = true
        requestBtn.isSelected = true
        
        listShowVw.isHidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyRequestsViewController.handleTap))
        tap.cancelsTouchesInView = false
        listShowVw?.addGestureRecognizer(tap)

        namesArr = ["   + Send Request","   + Add User"]

    }

    override func viewWillAppear(_ animated: Bool) {
        addBtn.bringSubview(toFront: self.view)
        addBtn.isHidden = false

    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        listShowVw.isHidden = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == requestTblVw {
            return 4
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SenseCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        if tableView == requestTblVw {
            if requestBtn.isSelected == true {
                cell.nameIdLbl.text = "Request"
                cell.deleteBtn.layer.borderColor = UIColor.white.cgColor
                cell.deleteBtn.backgroundColor = UIColor.clear

                cell.tickBtn.isHidden = false

            } else {
                cell.nameIdLbl.text = "All"
                cell.deleteBtn.backgroundColor = UIColor.red
                cell.deleteBtn.layer.borderColor = UIColor.red.cgColor

                cell.tickBtn.isHidden = true
            }
            cell.deleteBtn.layer.borderWidth = 1.0
            cell.deleteBtn.layer.masksToBounds = true
            cell.deleteBtn.layer.cornerRadius = 13.0
            
        } else if tableView == addListTblVw {
            cell.nameIdLbl.text = namesArr[indexPath.row]
            cell.nameIdLbl.layer.masksToBounds = true
            cell.nameIdLbl.layer.cornerRadius = 11.0
            
        } 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        
        if tableView == addListTblVw {
            listShowVw.isHidden = true
            
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "GoToSendRequestScreen", sender: self)
            }
            
        }
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
    
    @IBAction func menuBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func addBtnClicked(sender: UIButton!) {
        listShowVw.isHidden = false
        listShowVw.bringSubview(toFront: closeBtn)
        addBtn.isHidden = true
    }
    
    @IBAction func closeBtnClicked(sender: UIButton!) {
        listShowVw.isHidden = true
        addBtn.isHidden = false
    }

    @IBAction func requestBtnClicked(sender: UIButton!) {
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        requestLbl.isHidden = false
        allLbl.isHidden = true
        sender.isSelected = true
        allBtn.isSelected = false
        requestTblVw.reloadData()
    }
    
    @IBAction func allBtnClicked(sender: UIButton!) {
        
        requestLbl.isHidden = true
        allLbl.isHidden = false
        sender.isSelected = true
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        requestBtn.isSelected = false
        requestTblVw.reloadData()
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
