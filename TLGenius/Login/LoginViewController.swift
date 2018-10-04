//
//  LoginViewController.swift
//  TLGenius
//
//  Created by Apple on 8/8/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

class LoginViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {

    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    @IBOutlet weak var forgotPwdBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var showPwdBtn: UIButton!
    @IBOutlet weak var scrollVw: UIScrollView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.designBorders()
        let ssid = self.getWiFiName()
        print(ssid as Any)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.hideKeyboardWhenTappedAround()

    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        scrollVw?.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
        scrollVw?.contentOffset = .zero

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
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    func getWiFiName() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        return ssid
    }

    
    func designBorders() {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: emailTxtFld.frame.size.height - width, width: self.view.frame.size.width-(emailTxtFld.frame.origin.x*2), height: emailTxtFld.frame.size.height)
        border.borderWidth = width
        emailTxtFld.layer.addSublayer(border)
        emailTxtFld.layer.masksToBounds = true
        
        let border1 = CALayer()
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.darkGray.cgColor
        border1.frame = CGRect(x: 0, y: pwdTxtFld.frame.size.height - width1, width: self.view.frame.size.width-(pwdTxtFld.frame.origin.x*2), height: pwdTxtFld.frame.size.height)
        border1.borderWidth = width1
        pwdTxtFld.layer.addSublayer(border1)
        pwdTxtFld.layer.masksToBounds = true
        
        signinBtn.layer.cornerRadius = 17.0
    }
    
    @IBAction func signinBtnClicked(sender: UIButton!) {
        
//        if emailTxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter email.", controller: self)
//        } else if pwdTxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter password.", controller: self)
//        } else if !isValidEmail(testStr: (emailTxtFld?.text ?? "")) {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter valid email.", controller: self)
//        } else {
//            self.performSegue(withIdentifier:"GoToHomeScreen", sender: self)
//        }

        self.performSegue(withIdentifier:"GoToHomeScreen", sender: self)

    }
    
    @IBAction func signupBtnClicked(sender: UIButton!) {
        self.performSegue(withIdentifier:"GoToMobileVeriScreen", sender: self)
    }
    
    @IBAction func forgotPwdClicked(sender: UIButton!) {
        self.performSegue(withIdentifier:"GoToForgotPwdScreen", sender: self)
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
