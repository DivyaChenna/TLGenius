//
//  HomeViewController.swift
//  TLGenius
//
//  Created by Apple on 8/8/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var discoverBtn : UIButton!
    @IBOutlet weak var addBtn : UIButton!
    @IBOutlet weak var closeBtn : UIButton!
    @IBOutlet weak var logoutBtn : UIButton!
    
    @IBOutlet weak var notifBtn : UIButton!
    @IBOutlet weak var sosBtn : UIButton!
    @IBOutlet weak var informationBtn : UIButton!
    @IBOutlet weak var addHubBtn : UIButton!
    @IBOutlet weak var factoryResetBtn : UIButton!
    
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var nameMainLbl : UILabel!
    
    @IBOutlet weak var hubNameLbl : UILabel!
    
    @IBOutlet weak var profileImg : UIImageView!
    
    @IBOutlet weak var listTblVw : UITableView!
    @IBOutlet weak var hubsTblVw : UITableView!
    @IBOutlet weak var hubDetailsTblVw : UITableView!
    
    @IBOutlet weak var roomsCollectionVw : UICollectionView!
    @IBOutlet weak var groupsCollectionVw : UICollectionView!
    @IBOutlet weak var othersCollectionVw : UICollectionView!
    
    @IBOutlet weak var listShowVw : UIView!
    @IBOutlet weak var discoverVw : UIView!
    @IBOutlet weak var hubNotAvailVw : UIView!
    @IBOutlet weak var blackShadowVw: UIView!
    @IBOutlet weak var informationVw: UIView!
    @IBOutlet weak var topBlueVw : UIView!
    
    @IBOutlet weak var homeVw : UIView!
    
    @IBOutlet weak var scrollVW : UIScrollView!
    
    
    @IBOutlet weak var menuTblVw: UITableView!
    
    @IBOutlet weak var menuXConstarint: NSLayoutConstraint!
    
    var isConnectedHUb: NSString?
    var selectedIndex: Int?
    
    
    var namesArr = [String]()
    var hubDetailsArr = [String]()
    var hubSubDetailsArr = [String]()
    var menuNamesArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homeBtn.isSelected = true
        namesArr = ["    + Bulb","    + Room","    + Group","    + Band"]
        hubDetailsArr = ["Hub ID","Primary User ID to which it is Associated","RF ID","Firm Version","HW Version","Commissioning Date"]
        hubSubDetailsArr = ["Genius 1","Genius","Add2","2.0.1","2.4.5","3/03/19"]
        menuNamesArr = ["Edit","Delete"]
        
        listShowVw.isHidden = true
        informationVw.isHidden = true
        
        scrollVW.contentSize = CGSize(width: self.view.frame.size.width, height: 2000)
        
        self.allTapGestures()
        self.bordersForAllElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Reachability.isConnectedToNetwork() {
            print("Network Available")
            blackShadowVw.isHidden = true
            self.view.bringSubview(toFront: addBtn)
            addBtn.isHidden = false
        } else {
            print("Network Not Available")
            blackShadowVw.isHidden = false
        }
        
        isConnectedHUb = "yes"
        if isConnectedHUb == "yes" {
            discoverVw.isHidden = true
            homeVw.isHidden = false
        }
        else {
            discoverVw.isHidden = false
            homeVw.isHidden = true
        }
    }
    
    
    @IBAction func discoverBtnClicked(sender: UIButton!) {
        
        //        let configuration = NEHotspotConfiguration.init(ssid: "Genius", passphrase: "Genius123", isWEP: false)
        //        configuration.joinOnce = true
        //
        //        NEHotspotConfigurationManager.shared.apply(configuration) { (error) in
        //            if error != nil {
        //                if error?.localizedDescription == "already associated."{
        //                    print("Connected")
        //                }
        //                else {
        //                    print("No Connected")
        //                }
        //            }
        //            else {
        //                print("Connected")
        //            }
        //        }
        
        self.performSegue(withIdentifier:"GoToWifiListScreen", sender: self)
    }
    
    @IBAction func addBtnClicked(sender: UIButton!) {
        listShowVw.isHidden = false
        listShowVw.bringSubview(toFront: closeBtn)
        addBtn.isHidden = true
        listTblVw.isHidden = false
        closeBtn.isHidden = false
        menuTblVw.isHidden = true
    }
    
    @IBAction func closeBtnClicked(sender: UIButton!) {
        listShowVw.isHidden = true
        addBtn.isHidden = false
    }
    
    @IBAction func logoutBtnClicked(sender: UIButton!) {
        let allViewController: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        
        for loginVw : UIViewController in allViewController {
            if loginVw .isKind(of: LoginViewController.self) {
                self.navigationController?.popToViewController(loginVw, animated: true)
            }
        }
    }
    
    // MARK: UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == hubsTblVw {
            return 4
        }
        else if tableView == hubDetailsTblVw {
            return 6
        }
        else if tableView == menuTblVw {
            return 2
        }
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubsCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        if tableView == listTblVw {
            cell.nameIdLbl.text = namesArr[indexPath.row]
            cell.nameIdLbl.layer.masksToBounds = true
            cell.nameIdLbl.layer.cornerRadius = 12.0
        } else if tableView == hubsTblVw {
            
            
        }
        else if tableView == hubDetailsTblVw {
            cell.nameIdLbl.text = hubDetailsArr[indexPath.row]
            cell.idLbl.text = hubSubDetailsArr[indexPath.row]
        }
        else if tableView == menuTblVw && tableView.tag == 1{
            cell.nameIdLbl.text = menuNamesArr[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        
        if tableView == listTblVw {
            listShowVw.isHidden = true
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "GoToDiscoverBulbsScreen", sender: self)
            }
            else if indexPath.row == 1 {
                self.performSegue(withIdentifier: "GoToAddRoomScreen", sender: self)
            }
            else if indexPath.row == 2 {
                self.performSegue(withIdentifier: "GoToAddGroupScreen", sender: self)
            }
            else if indexPath.row == 3 {
                 self.performSegue(withIdentifier: "GoToAddBandScreen", sender: self)
            }
        }
        
        if tableView == menuTblVw {
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "GoToLivingRoomScreen", sender: self)
                listShowVw.isHidden = true
            }
        }
    }
    
    
    // MARK: UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomCell", for: indexPath) as? SliderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        if selectedIndex == indexPath.row {
            cell.backgroundColor = UIColor.init(red: 49.0/255.0, green: 40.0/255.0, blue: 106.0/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.init(red: 34.0/255.0, green: 31.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        }
        
        if collectionView == roomsCollectionVw {
            cell.lblName.text = "Living Room"
        }
        else if collectionView == groupsCollectionVw{
            cell.lblName.text = "Group"
        }
        else if collectionView == othersCollectionVw{
            cell.lblName.text = "Sample"
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let cell = collectionView.cellForItem(at: indexPath)
        
        print(selectedIndex!)
        if collectionView == roomsCollectionVw {
            roomsCollectionVw.reloadData()

            listShowVw.isHidden = false
            menuTblVw.isHidden = false
            listTblVw.isHidden = true
            closeBtn.isHidden = true
            
            let buttonPosition = (cell as AnyObject).convert(CGPoint.zero, to:listShowVw)
            print(buttonPosition)
            
            menuXConstarint.constant = buttonPosition.x
            
            menuTblVw.layer.borderColor = UIColor.lightGray.cgColor
            menuTblVw.layer.borderWidth = 1.0
            menuTblVw.layer.masksToBounds = true
            menuTblVw.layer.cornerRadius = 5.0
            
            menuTblVw.reloadData()
            listShowVw.bringSubview(toFront: menuTblVw)
        }
        else if collectionView == groupsCollectionVw{
            groupsCollectionVw.reloadData()
        }
        else if collectionView == othersCollectionVw{
            othersCollectionVw.reloadData()
        }
    }
    
    @IBAction func notifBtnClicked(sender: UIButton!) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationsViewController") as? NotificationsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func sosBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func adHubBtnClicked(sender: UIButton!) {
        
    }
    
    @IBAction func informationBtnClicked(sender: UIButton!) {
        informationVw.isHidden = false
        addBtn.isHidden = true
    }
    
    @IBAction func sendRequestBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func bandBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func requestsBtnClicked(sender: UIButton!) {
                self.performSegue(withIdentifier:"GoToRequestsScreen", sender: self)
    }
    
    @IBAction func menuBtnClicked(sender: UIButton!) {
                self.performSegue(withIdentifier:"GoToMenuScreen", sender: self)
    }
    
    @IBAction func factoryResetBtnClicked(sender: UIButton!) {
        
    }
    
    func bordersForAllElements() {
        discoverBtn.layer.cornerRadius = 20.0
        addBtn.layer.cornerRadius = 25.0
        closeBtn.layer.cornerRadius = 25.0
        addHubBtn.layer.cornerRadius = 15.0
        factoryResetBtn.layer.cornerRadius = 15.0
        
        topBlueVw.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    func allTapGestures() {
        let dismisstap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissView))
        dismisstap.cancelsTouchesInView = false
        blackShadowVw?.addGestureRecognizer(dismisstap)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.handleTap))
        tap.cancelsTouchesInView = false
        listShowVw?.addGestureRecognizer(tap)
        
        let removeInformationtap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.removeInformationTap))
        removeInformationtap.cancelsTouchesInView = false
        informationVw?.addGestureRecognizer(removeInformationtap)
    }
    
    @objc func dismissView() {
        view.endEditing(true)
        blackShadowVw.isHidden = true
    }
    
    @objc func removeInformationTap(sender: UITapGestureRecognizer? = nil) {
        informationVw.isHidden = true
        addBtn.isHidden = false
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        listShowVw.isHidden = true
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
