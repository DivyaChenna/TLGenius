//
//  MobileVerificationViewController.swift
//  TLGenius
//
//  Created by Apple on 8/9/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MobileVerificationViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate  {
    @IBOutlet weak var phoneTxtFld: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var scrollVw: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.hideKeyboardWhenTappedAround()
        
        self.designBorders()

    }

    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MobileVerificationViewController.dismissKeyboard))
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 10 {
            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter only 10 digits", controller: self)
        }
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func designBorders() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: phoneTxtFld.frame.size.height - width, width: self.view.frame.size.width-(phoneTxtFld.frame.origin.x*2), height: phoneTxtFld.frame.size.height)
        border.borderWidth = width
        phoneTxtFld.layer.addSublayer(border)
        phoneTxtFld.layer.masksToBounds = true
        
        nextBtn.layer.cornerRadius = 15.0
    }
    
    
    func isValidPhone(phone: String) -> Bool {
        
        let phoneRegex = "^[0-9]{6,14}$";
        let valid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phone)
        return valid
    }
    
    @IBAction func nextBtnClicked(sender: UIButton!) {
        
        //        if phoneTxtFld?.text?.isEmpty ?? true {
        //            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter phone number", controller: self)
        //        } else if !isValidPhone(phone: (phoneTxtFld?.text ?? "")) {
        //            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter valid phone number", controller: self)
        //        } else {
        //            self.performSegue(withIdentifier:"GoToOTPScreen", sender: self)
        //        }
        
        self.performSegue(withIdentifier:"GoToEnterOTPScreen", sender: self)
    }
    
    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
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
