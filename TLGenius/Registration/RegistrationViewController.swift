//
//  RegistrationViewController.swift
//  TLGenius
//
//  Created by Apple on 8/8/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {
    
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var address1TxtFld: UITextField!
    @IBOutlet weak var address2TxtFld: UITextField!
    @IBOutlet weak var landmarkTxtFld: UITextField!
    @IBOutlet weak var cityTxtFld: UITextField!
    @IBOutlet weak var stateTxtFld: UITextField!
    @IBOutlet weak var pincodeTxtFld: UITextField!
    @IBOutlet weak var countryTxtFld: UITextField!

    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!

    @IBOutlet weak var scrollVw: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.designBorders()
        
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
    }
    
    
    @objc func keyboardWillHide(notification:NSNotification) {
        scrollVw?.contentOffset = .zero
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !(textField == nameTxtFld || textField == emailTxtFld){
            scrollVw?.contentOffset = CGPoint(x:0, y:textField.frame.origin.y-100)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    @IBAction func signupBtnClicked(sender: UIButton!) {
        
//        if nameTxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter name", controller: self)
//        } else if emailTxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter email", controller: self)
//        } else if !isValidEmail(testStr: (emailTxtFld?.text ?? "")) {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter valid email", controller: self)
//        } else if address1TxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter address line 1", controller: self)
//        } else if cityTxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter city", controller: self)
//        } else if stateTxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter state", controller: self)
//        } else if pincodeTxtFld?.text?.isEmpty ?? true {
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter pincode", controller: self)
//        } else {
//            self.performSegue(withIdentifier:"GoToHomeScreen", sender: self)
//        }
        
        self.performSegue(withIdentifier:"GoToHomeScreen", sender: self)
    }
    
    @IBAction func signinBtnClicked(sender: UIButton!) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
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
        border1.frame = CGRect(x: 0, y: nameTxtFld.frame.size.height - width1, width: self.view.frame.size.width-(nameTxtFld.frame.origin.x*2), height: nameTxtFld.frame.size.height)
        border1.borderWidth = width1
        nameTxtFld.layer.addSublayer(border1)
        nameTxtFld.layer.masksToBounds = true
        
        
        let border2 = CALayer()
        let width2 = CGFloat(1.0)
        border2.borderColor = UIColor.darkGray.cgColor
        border2.frame = CGRect(x: 0, y: address1TxtFld.frame.size.height - width2, width: self.view.frame.size.width-(address1TxtFld.frame.origin.x*2), height: address1TxtFld.frame.size.height)
        border2.borderWidth = width2
        address1TxtFld.layer.addSublayer(border2)
        address1TxtFld.layer.masksToBounds = true
        
        
        let border3 = CALayer()
        let width3 = CGFloat(1.0)
        border3.borderColor = UIColor.darkGray.cgColor
        border3.frame = CGRect(x: 0, y: address2TxtFld.frame.size.height - width3, width: self.view.frame.size.width-(address2TxtFld.frame.origin.x*2), height: address2TxtFld.frame.size.height)
        border3.borderWidth = width3
        address2TxtFld.layer.addSublayer(border3)
        address2TxtFld.layer.masksToBounds = true

        
        let border4 = CALayer()
        let width4 = CGFloat(1.0)
        border4.borderColor = UIColor.darkGray.cgColor
        border4.frame = CGRect(x: 0, y: landmarkTxtFld.frame.size.height - width4, width: self.view.frame.size.width-(landmarkTxtFld.frame.origin.x*2), height: landmarkTxtFld.frame.size.height)
        border4.borderWidth = width4
        landmarkTxtFld.layer.addSublayer(border4)
        landmarkTxtFld.layer.masksToBounds = true
        
        
        let border5 = CALayer()
        let width5 = CGFloat(1.0)
        border5.borderColor = UIColor.darkGray.cgColor
        border5.frame = CGRect(x: 0, y: cityTxtFld.frame.size.height - width5, width: self.view.frame.size.width-(cityTxtFld.frame.origin.x*2), height: cityTxtFld.frame.size.height)
        border5.borderWidth = width5
        cityTxtFld.layer.addSublayer(border5)
        cityTxtFld.layer.masksToBounds = true
        
        
        let border6 = CALayer()
        let width6 = CGFloat(1.0)
        border6.borderColor = UIColor.darkGray.cgColor
        border6.frame = CGRect(x: 0, y: stateTxtFld.frame.size.height - width6, width: self.view.frame.size.width-(stateTxtFld.frame.origin.x*2), height: stateTxtFld.frame.size.height)
        border6.borderWidth = width6
        stateTxtFld.layer.addSublayer(border6)
        stateTxtFld.layer.masksToBounds = true
        
        
        let border7 = CALayer()
        let width7 = CGFloat(1.0)
        border7.borderColor = UIColor.darkGray.cgColor
        border7.frame = CGRect(x: 0, y: pincodeTxtFld.frame.size.height - width7, width: self.view.frame.size.width-(pincodeTxtFld.frame.origin.x*2), height: pincodeTxtFld.frame.size.height)
        border7.borderWidth = width7
        pincodeTxtFld.layer.addSublayer(border7)
        pincodeTxtFld.layer.masksToBounds = true

        let border8 = CALayer()
        let width8 = CGFloat(1.0)
        border8.borderColor = UIColor.darkGray.cgColor
        border8.frame = CGRect(x: 0, y: countryTxtFld.frame.size.height - width8, width: self.view.frame.size.width-(countryTxtFld.frame.origin.x*2), height: countryTxtFld.frame.size.height)
        border8.borderWidth = width8
        countryTxtFld.layer.addSublayer(border8)
        countryTxtFld.layer.masksToBounds = true

        signupBtn.layer.cornerRadius = 15.0
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
