//
//  ResetPwdViewController.swift
//  TLGenius
//
//  Created by Apple on 8/9/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ResetPwdViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {

    @IBOutlet weak var pwdTxtFld: UITextField!
    @IBOutlet weak var newPwdTxtFld: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var scrollVw: UIScrollView!
    @IBOutlet weak var showPwdBtn: UIButton!
    @IBOutlet weak var showCnfrmPwdBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.hideKeyboardWhenTappedAround()
        
        self.designBorders()

    }

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        scrollVw?.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollVw?.contentOffset = CGPoint(x:0, y:keyboardFrame.size.height-100)
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

    
    func designBorders() {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: pwdTxtFld.frame.size.height - width, width: self.view.frame.size.width-(pwdTxtFld.frame.origin.x*2), height: pwdTxtFld.frame.size.height)
        border.borderWidth = width
        pwdTxtFld.layer.addSublayer(border)
        pwdTxtFld.layer.masksToBounds = true
        
        
        let border1 = CALayer()
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.darkGray.cgColor
        border1.frame = CGRect(x: 0, y: newPwdTxtFld.frame.size.height - width, width: self.view.frame.size.width-(newPwdTxtFld.frame.origin.x*2), height: newPwdTxtFld.frame.size.height)
        border1.borderWidth = width1
        newPwdTxtFld.layer.addSublayer(border1)
        newPwdTxtFld.layer.masksToBounds = true
        
        submitBtn.layer.cornerRadius = 15.0
    }
    

    @IBAction func submitBtnClicked(sender: UIButton!) {
        
//                if pwdTxtFld?.text?.isEmpty ?? true {
//                    Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter password", controller: self)
//                } else if newPwdTxtFld?.text?.isEmpty ?? true {
//                    Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter new password", controller: self)
//                }
//                else if !(pwdTxtFld?.text == newPwdTxtFld?.text) {
//                    Utils.showAlertWithTitleInController(APP_NAME, message: "Password and new password are not same", controller: self)
//                }else {
////                    self.performSegue(withIdentifier:"GoToOTPScreen", sender: self)
//                }
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.navigationController?.pushViewController(vc!, animated: true)

    }

    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
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

    @IBAction func showCnfrmPwdBtnClicked(sender: UIButton!) {
        if sender.isSelected {
            sender.isSelected = false
            newPwdTxtFld.isSecureTextEntry = true
        } else {
            sender.isSelected = true
            newPwdTxtFld.isSecureTextEntry = false
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
