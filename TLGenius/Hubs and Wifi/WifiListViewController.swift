//
//  WifiListViewController.swift
//  TLGenius
//
//  Created by Apple on 8/23/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class WifiListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var refreshBtn: UIButton!

    @IBOutlet weak var wifiListTblVw: UITableView!
    
    @IBOutlet weak var wifiNameLbl: UILabel!
    @IBOutlet weak var popupWifiNameLbl: UILabel!

    @IBOutlet weak var passwordVw: UIView!
    @IBOutlet weak var unsuccessVw: UIView!
    @IBOutlet weak var blackShadowVw: UIView!
    @IBOutlet weak var successBlueVw : UIView!
    @IBOutlet weak var unSuccessBlueVw : UIView!


    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var connectBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var showPwdBtn: UIButton!

    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!

    @IBOutlet weak var blackVwYConstraint: NSLayoutConstraint!

    var wifiNamesArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.designBorders()
        
        wifiNamesArr = ["Abc","Deuglo","Kijag","Test"]

        wifiListTblVw.tableFooterView = UIView()
        blackShadowVw.isHidden = true
        
        
//        self.hideKeyboardWhenTappedAround()
        
    }
    
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WifiListViewController.dismissKeyboard))
////        tap.cancelsTouchesInView = false
//        blackShadowVw?.addGestureRecognizer(tap)
//
//    }
//
//    @objc func dismissKeyboard() {
////        view.endEditing(true)
//        blackShadowVw.isHidden = true
//    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print(textField.frame.origin.y)

        if textField == userNameTxtFld {
            blackVwYConstraint.constant = textField.frame.origin.y - 300
        } else if textField == pwdTxtFld {
            blackVwYConstraint.constant = textField.frame.origin.y - 300

        }
        print(blackVwYConstraint.constant)

        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        blackVwYConstraint.constant = 20

        return true;

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
//        blackShadowVw.isHidden = true

        let touch = touches.first
        if(touch?.view == passwordVw){
            blackShadowVw.isHidden = false
        } else {
            blackShadowVw.isHidden = true
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubsCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        cell.nameIdLbl.text = wifiNamesArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        
        self.view.bringSubview(toFront: blackShadowVw)
        blackShadowVw.isHidden = false
        passwordVw.isHidden = false
        unsuccessVw.isHidden = true
        
    }

    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func refreshBtnClicked(sender: UIButton!) {
    }

    @IBAction func cancelBtnClicked(sender: UIButton!) {
        blackShadowVw.isHidden = false
        passwordVw.isHidden = true
        unsuccessVw.isHidden = false
    }

    @IBAction func connectBtnClicked(sender: UIButton!) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        vc?.isConnectedHUb = "yes"
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    @IBAction func okBtnClicked(sender: UIButton!) {
        blackShadowVw.isHidden = true
        passwordVw.isHidden = true
        unsuccessVw.isHidden = true
    }

    @IBAction func showPwdBtnClicked(sender: UIButton!) {
        passwordVw.isHidden = false
        if sender.isSelected {
            sender.isSelected = false
            pwdTxtFld.isSecureTextEntry = true
        } else {
            sender.isSelected = true
            pwdTxtFld.isSecureTextEntry = false
        }
    }

    func designBorders() {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: userNameTxtFld.frame.size.height - width, width: self.view.frame.size.width-(userNameTxtFld.frame.origin.x*2), height: userNameTxtFld.frame.size.height)
        border.borderWidth = width
        userNameTxtFld.layer.addSublayer(border)
        userNameTxtFld.layer.masksToBounds = true

        
        let border1 = CALayer()
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.lightGray.cgColor
        border1.frame = CGRect(x: 0, y: pwdTxtFld.frame.size.height - width1, width: self.view.frame.size.width-(pwdTxtFld.frame.origin.x*2), height: pwdTxtFld.frame.size.height)
        border1.borderWidth = width1
        pwdTxtFld.layer.addSublayer(border1)
        pwdTxtFld.layer.masksToBounds = true
        
        successBlueVw.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        unSuccessBlueVw.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

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
