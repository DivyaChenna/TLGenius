//
//  BandSignInViewController.swift
//  TLGenius
//
//  Created by Apple on 9/5/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class BandSignInViewController: UIViewController,UIScrollViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!

    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!

    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var showPwdBtn: UIButton!

    @IBOutlet weak var scrollVw: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.designBorders()
        
    }

    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollVw?.contentOffset = CGPoint(x:0, y:keyboardFrame.size.height-150)
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        scrollVw?.contentOffset = .zero
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

    @IBAction func signinBtnClicked(sender: UIButton!) {
        self.performSegue(withIdentifier: "GoToBandSubscScreen", sender: self)
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

    func designBorders() {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: usernameTxtFld.frame.size.height - width, width: self.view.frame.size.width-(usernameTxtFld.frame.origin.x*2), height: usernameTxtFld.frame.size.height)
        border.borderWidth = width
        usernameTxtFld.layer.addSublayer(border)
        usernameTxtFld.layer.masksToBounds = true
        
        let border1 = CALayer()
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.darkGray.cgColor
        border1.frame = CGRect(x: 0, y: pwdTxtFld.frame.size.height - width1, width: self.view.frame.size.width-(pwdTxtFld.frame.origin.x*2), height: pwdTxtFld.frame.size.height)
        border1.borderWidth = width1
        pwdTxtFld.layer.addSublayer(border1)
        pwdTxtFld.layer.masksToBounds = true
        
        signinBtn.layer.cornerRadius = 17.0
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        scrollVw?.addGestureRecognizer(tap)
    
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        scrollVw?.contentOffset = .zero
        
    }
    

    @IBAction func showPwdBtnClicked(sender: UIButton!) {
        if sender.isSelected {
            sender.isSelected = false
            pwdTxtFld.isSecureTextEntry = true
        } else {
            sender.isSelected = true
            pwdTxtFld.isSecureTextEntry = false
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
