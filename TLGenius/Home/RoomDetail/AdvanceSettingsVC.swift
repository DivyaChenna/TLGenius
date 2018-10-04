//
//  AdvanceSettingsVC.swift
//  TLGenius
//
//  Created by Apple on 9/25/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class AdvanceSettingsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var tableviewData: UITableView!
    
    var arrSettingName:[String] = ["Bulb Id","Hub Id","Rf Id","Total Usage Hours","Firmware Version","HW Version","Commissioning Date","Energy Consumption(Total)","Energy Consumption(This Month)","Add buld to emergency group"]
    var arrSettingType:[String] = ["Abc 1","Abc","Add2","10 Hr","2.0.2","1.0.2","1/02/19","2.0.2W","1.0.2W","abc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSettingName.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AdvanceSettingsCell
        
        if indexPath.row == 9{
            cell.lblSettingType.isHidden = true
            cell.onswitch.isHidden = false
//            cell.onswitch.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)

            cell.lblSettingName.text = arrSettingName[indexPath.row]
            cell.btnRemove.isHidden = true
            cell.btnReset.isHidden  = true
            cell.stpView.isHidden = true
        }else if indexPath.row == 10{
            
            cell.lblSettingName.isHidden = true
            cell.lblSettingType.isHidden = true
            cell.onswitch.isHidden = true
            cell.btnRemove.isHidden = false
            cell.btnReset.isHidden  = false
            cell.stpView.isHidden = true
        }
            
        else {
            cell.lblSettingType.isHidden = false
            cell.lblSettingName.isHidden = false
            cell.onswitch.isHidden = true
            cell.btnRemove.isHidden = true
            cell.btnReset.isHidden  = true
            cell.stpView.isHidden = true
            cell.lblSettingName.text = arrSettingName[indexPath.row]
            cell.lblSettingType.text = arrSettingType[indexPath.row]
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sosBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func NotifBtnClicked(sender: UIButton!) {
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
