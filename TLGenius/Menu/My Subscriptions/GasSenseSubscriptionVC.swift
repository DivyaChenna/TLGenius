//
//  GasSenseSubscriptionVC.swift
//  TLGenius
//
//  Created by Apple on 9/24/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class GasSenseSubscriptionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!

    @IBOutlet var lblNotification: UILabel!
    @IBOutlet var titleNameLbl: UILabel!

    @IBOutlet var senseCollectionVw: UICollectionView!
    var selectedSenseStr : NSString?

    @IBOutlet var btnBuy: UIButton!
    
    @IBOutlet var btnAdd: UIButton!
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var blackShadowVw : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNotification.layer.cornerRadius = lblNotification.frame.size.height/2
        lblNotification.clipsToBounds = true
        // Do any additional setup after loading the view.
        
        titleNameLbl.text = (selectedSenseStr! as String)
        btnAdd.layer.cornerRadius = 20
        btnAdd.clipsToBounds = true
        btnBuy.layer.cornerRadius = 20
        btnBuy.clipsToBounds = true
        backView.layer.cornerRadius = 6
        backView.clipsToBounds = true

        blackShadowVw.isHidden = true
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
        cell.backView.layer.cornerRadius = 8
        cell.backView.clipsToBounds = true
        cell.btnActive.layer.cornerRadius = 20
        cell.btnActive.clipsToBounds  = true
        
        cell.btnActive.addTarget(self, action: #selector(GasSenseSubscriptionVC.activeBtnClicked(sender:)), for: .touchUpInside)

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width/2 + 80
        let height = collectionView.frame.size.height
        let cellsize = CGSize(width: width, height: height)
        return cellsize
    }

    @objc func activeBtnClicked(sender: UIButton!) {
        blackShadowVw.isHidden  = false
    }
    
    
    @IBAction func addNewBtnClicked(sender: UIButton!) {
        blackShadowVw.isHidden = true
    }
    
    @IBAction func buyBtnClicked(sender: UIButton!) {
        blackShadowVw.isHidden = true

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




