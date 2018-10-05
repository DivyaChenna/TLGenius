//
//  BulbDetailsViewController.swift
//  TLGenius
//
//  Created by Apple on 8/30/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class BulbDetailsViewController: UIViewController,UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    @IBOutlet weak var addBtn : UIButton!

    @IBOutlet weak var saveBtn : UIButton!
    @IBOutlet weak var addRoomBtn : UIButton!

    @IBOutlet weak var editBtn : UIButton!
    @IBOutlet weak var dropDownBtn : UIButton!

    @IBOutlet weak var bulbNameTxtFld : UITextField!
    @IBOutlet weak var roomIconCollectionVw : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addBtn.layer.cornerRadius = 25.0
        saveBtn.layer.cornerRadius = 15.0
        addRoomBtn.layer.cornerRadius = 15.0

        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: bulbNameTxtFld.frame.size.height - width, width: self.view.frame.size.width-(bulbNameTxtFld.frame.origin.x*2), height: bulbNameTxtFld.frame.size.height)
        border.borderWidth = width
        bulbNameTxtFld.layer.addSublayer(border)
        bulbNameTxtFld.layer.masksToBounds = true

        let border1 = CALayer()
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.darkGray.cgColor
        border1.frame = CGRect(x: 0, y: dropDownBtn.frame.size.height - width1, width: self.view.frame.size.width-(dropDownBtn.frame.origin.x*2), height: dropDownBtn.frame.size.height)
        border1.borderWidth = width1
        dropDownBtn.layer.addSublayer(border1)
        dropDownBtn.layer.masksToBounds = true
        dropDownBtn.imageEdgeInsets = UIEdgeInsetsMake(0, self.view.frame.size.width-70, 0, 0)

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomCell", for: indexPath) as? SliderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
        
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
    
    @IBAction func bandBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func requestsBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func addBtnClicked(sender: UIButton!) {
    }

    
    @IBAction func editBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func dropDownBtnClicked(sender: UIButton!) {
    }

    
    @IBAction func saveBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func addRoomBtnClicked(sender: UIButton!) {
        let addRoomVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddRoomViewController") as? AddRoomViewController
        self.navigationController?.pushViewController(addRoomVC!, animated: true)

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
