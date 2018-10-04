//
//  LivingRoomViewController.swift
//  TLGenius
//
//  Created by Apple on 9/14/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class LivingRoomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    
    @IBOutlet weak var bulbsBtn : UIButton!
    @IBOutlet weak var groupBtn : UIButton!
    @IBOutlet weak var logoutBtn : UIButton!
    
    @IBOutlet weak var bulbsSelectLbl : UILabel!
    @IBOutlet weak var groupSelectLbl : UILabel!
    
    @IBOutlet weak var bulbCollectionVw : UICollectionView!
    @IBOutlet weak var setScenesCollectionVw : UICollectionView!
    @IBOutlet weak var myScenesCollectionVw : UICollectionView!

    @IBOutlet weak var liteSlider : UISlider!
    @IBOutlet weak var scrollVw : UIScrollView!

    @IBOutlet weak var hueSatImage : UIImageView!
    @IBOutlet weak var colorVw : UIView!
    @IBOutlet weak var showDatePickerVw : UIView!

    @IBOutlet weak var saveSceneBtn : UIButton!
    @IBOutlet weak var savePlayTimeBtn : UIButton!
    @IBOutlet weak var setPlayTimeBtn : UIButton!
    @IBOutlet weak var advanceSettingsBtn : UIButton!
    @IBOutlet weak var addBtn : UIButton!

    @IBOutlet weak var fromDatePicker : UIDatePicker!
    @IBOutlet weak var toDatePicker : UIDatePicker!

    @IBOutlet weak var advanceBtnYConstraint : NSLayoutConstraint!

    @IBOutlet weak var closeBtn : UIButton!
    
    @IBOutlet weak var blackShadowVw : UIView!
    @IBOutlet weak var addListTblVw : UITableView!

    var bulbArray = [String]()
    
    var selectedIndex: Int?

    var currentBrightness: CGFloat?
    var currentHue: CGFloat?
    var currentSaturation: CGFloat?

    var lastLocation:CGPoint = CGPoint(x:0, y:0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setPlayTimeBtn.isSelected = false

        bulbsSelectLbl.isHidden = false
        groupSelectLbl.isHidden = true
        bulbsBtn.isSelected = true
        saveSceneBtn.layer.cornerRadius = 15.0
        savePlayTimeBtn.layer.cornerRadius = 15.0
        
        advanceBtnYConstraint.constant = 20
        blackShadowVw.isHidden = true

        addBtn.layer.cornerRadius = 25.0
        addBtn.bringSubview(toFront: self.view)
        closeBtn.layer.cornerRadius = 25.0

        bulbArray = ["Bulb 1","Bulb 2","Bulb 3","Bulb 4"]


        hueSatImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(detectPan)))

        hueSatImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
        fromDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        toDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        showDatePickerVw.isHidden = true
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LivingRoomViewController.handleTap))
        tap.cancelsTouchesInView = false
        blackShadowVw?.addGestureRecognizer(tap)
        

    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        view.endEditing(true)
        blackShadowVw.isHidden = true
        addBtn.isHidden = false
    }

    override func viewWillAppear(_ animated: Bool) {
        if setPlayTimeBtn.isSelected {
            scrollVw.contentSize = CGSize(width: self.view.frame.size.width, height: 1300)
        }
        else {
            scrollVw.contentSize = CGSize(width: self.view.frame.size.width, height: 950)
        }

    }
    
    @objc private func detectPan(recognizer:UIPanGestureRecognizer) {
        
        let positionInHueSat: CGPoint? = recognizer.location(in: hueSatImage)
        currentBrightness = 2.0 - ((positionInHueSat?.x ?? 0.0) / hueSatImage.frame.size.width)
        
        currentHue = (positionInHueSat?.x ?? 0.0) / hueSatImage.frame.size.width
        currentSaturation = 1.0 - (positionInHueSat?.y ?? 0.0) / hueSatImage.frame.size.height
        
        let _tcolor = UIColor(hue: currentHue!, saturation: currentSaturation!, brightness: currentBrightness!, alpha: 1.0)
        
        colorVw.backgroundColor = _tcolor

    }

    
    @objc private func imageTapped(_ recognizer: UITapGestureRecognizer) {
        
        let positionInHueSat: CGPoint? = recognizer.location(in: hueSatImage)
        currentBrightness = 2.0 - ((positionInHueSat?.x ?? 0.0) / hueSatImage.frame.size.width)
        
        currentHue = (positionInHueSat?.x ?? 0.0) / hueSatImage.frame.size.width
        currentSaturation = 1.0 - (positionInHueSat?.y ?? 0.0) / hueSatImage.frame.size.height
        
        let _tcolor = UIColor(hue: currentHue!, saturation: currentSaturation!, brightness: currentBrightness!, alpha: 1.0)
        
        colorVw.backgroundColor = _tcolor
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubsCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.nameIdLbl.layer.masksToBounds = true
        cell.nameIdLbl.layer.cornerRadius = 12.0

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == addListTblVw {
            self.performSegue(withIdentifier: "GoToAddSceneScreen", sender: self)
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bulbCollectionVw {
            return bulbArray.count
        }
        else if collectionView == setScenesCollectionVw {
            
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! SliderCollectionViewCell
        
        if collectionView == bulbCollectionVw {
            cell.lblName.text = bulbArray[indexPath.row]
            
            if selectedIndex == indexPath.row {
                cell.lblName.backgroundColor = UIColor.init(red: 50.0/255.0, green: 43.0/255.0, blue: 106.0/255.0, alpha: 1.0)
            } else {
                cell.lblName.backgroundColor = UIColor.init(red: 30.0/255.0, green: 27.0/255.0, blue: 61.0/255.0, alpha: 1.0)
            }
        }

        

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
//        let cell = collectionView.cellForItem(at: indexPath)
        
        print(selectedIndex!)
        if collectionView == bulbCollectionVw {
            bulbCollectionVw.reloadData()
            
        }
        
    }

    
    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sosBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func NotifBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func sendRequestBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func bandBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func requestsBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func menuBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func saveSceneBtnClicked(sender: UIButton!) {
        
    }
    
    @IBAction func savePlayTimeBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func advanceSettingsBtnClicked(sender: UIButton!) {
        self.performSegue(withIdentifier: "GoToAdvanceSettingsScreen", sender: self)
    }


    @IBAction func setPlayTimeBtnClicked(sender: UIButton!) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            showDatePickerVw.isHidden = false
            advanceBtnYConstraint.constant = 400

        }
        else {
            showDatePickerVw.isHidden = true
            advanceBtnYConstraint.constant = 20

        }
    }

    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        print("Slider changing to \(currentValue) ?")
    }

    @IBAction func bulbBtnClicked(sender: UIButton!) {
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        bulbsSelectLbl.isHidden = false
        groupSelectLbl.isHidden = true
        sender.isSelected = true
        groupBtn.isSelected = false
    }
    
    @IBAction func groupBtnClicked(sender: UIButton!) {
        
        bulbsSelectLbl.isHidden = true
        groupSelectLbl.isHidden = false
        sender.isSelected = true
        sender.setTitleColor(UIColor.white, for: UIControlState.normal)
        groupBtn.isSelected = false
    }
    
    @IBAction func logoutBtnClicked(sender: UIButton!) {
        let allViewController: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        
        for loginVw : UIViewController in allViewController {
            if loginVw .isKind(of: LoginViewController.self) {
                self.navigationController?.popToViewController(loginVw, animated: true)
            }
        }
    }
    
    @IBAction func addBtnClicked(sender: UIButton!) {
        blackShadowVw.isHidden = false
        blackShadowVw.bringSubview(toFront: closeBtn)
        addBtn.isHidden = true
        
    }
    
    @IBAction func closeBtnClicked(sender: UIButton!) {
        blackShadowVw.isHidden = true
        addBtn.isHidden = false
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
