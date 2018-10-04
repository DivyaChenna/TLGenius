//
//  MenuViewController.swift
//  TLGenius
//
//  Created by Apple on 8/22/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!

    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    

    @IBOutlet weak var menuTblVw: UITableView!
    
    var namesArr = [String]()
    var imgArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgArr = ["help","privacy","terms","subscription","preferences","emergancy","about","alert","contact","logout"]
        namesArr = ["Help","Privacy Policy","Terms of Usage","My Subscriptions","My Preferences","Emergency Contacts","Alert History","About Us","Contact Us","Logout"]

        menuBtn.isSelected = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        cell.nameIdLbl.text = namesArr[indexPath.row]
        cell.signalImgVw.image =  UIImage(named: imgArr[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        
        
        
        if indexPath.row == 0 {
            self.performSegue(withIdentifier:"GoToHelpScreen", sender: self)
        }
        else if indexPath.row == 3 {
            self.performSegue(withIdentifier:"GoToSubscriptionScreen", sender: self)
        }
        else if indexPath.row == 4 {
            self.performSegue(withIdentifier:"GoToPreferencesScreen", sender: self)
        }
        else if indexPath.row == 5 {
            self.performSegue(withIdentifier:"GoToEmergancyContactsScreen", sender: self)
        }
        else if indexPath.row == 6 {
            self.performSegue(withIdentifier:"GoToAlertHistoryScreen", sender: self)
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
    
    @IBAction func requestsBtnClicked(sender: UIButton!) {
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
