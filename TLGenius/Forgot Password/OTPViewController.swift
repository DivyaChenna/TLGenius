//
//  OTPViewController.swift
//  TLGenius
//
//  Created by Apple on 8/9/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {

    @IBOutlet weak var firstTxtFld: UITextField!
    @IBOutlet weak var secondTxtFld: UITextField!
    @IBOutlet weak var thirdTxtFld: UITextField!
    @IBOutlet weak var fourthTxtFld: UITextField!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var scrollVw: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.hideKeyboardWhenTappedAround()

        nextBtn.layer.cornerRadius = 15.0
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text
        if (text?.count)! >= 1{
            switch textField{
            case firstTxtFld:
                secondTxtFld.becomeFirstResponder()
            case secondTxtFld:
                thirdTxtFld.becomeFirstResponder()
            case thirdTxtFld:
                fourthTxtFld.becomeFirstResponder()
            case fourthTxtFld:
                fourthTxtFld.resignFirstResponder()
            default:
                break
            }
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func nextBtnClicked(sender: UIButton!) {
        
//        if firstTxtFld?.text?.isEmpty ?? true || secondTxtFld?.text?.isEmpty ?? true || thirdTxtFld?.text?.isEmpty ?? true || fourthTxtFld?.text?.isEmpty ?? true{
//            Utils.showAlertWithTitleInController(APP_NAME, message: "Please enter OTP", controller: self)
//        }
//        else {
//            self.performSegue(withIdentifier:"GoToResetScreen", sender: self)
//        }
        
        self.performSegue(withIdentifier:"GoToResetScreen", sender: self)
    }
    
    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func resendBtnClicked(sender: UIButton!) {
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
