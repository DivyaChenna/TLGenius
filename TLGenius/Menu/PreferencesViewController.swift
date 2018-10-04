//
//  PreferencesViewController.swift
//  TLGenius
//
//  Created by Apple on 8/23/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!

    @IBOutlet weak var listTblVw: UITableView!

    var namesArr = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuBtn.isSelected = true

        namesArr = ["Low Batter Alert","Gas Leak Alert","ElderSense Alert"]

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SenseCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.nameIdLbl.text = namesArr[indexPath.row]

        cell.alertSwitch.addTarget(self, action: #selector(PreferencesViewController.switchValueChanged(sender:)), for: .valueChanged)
        cell.alertSwitch.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)

        return cell
    }
    
    @objc func switchValueChanged(sender: UISwitch!) {
        if sender.isOn {
            sender.isOn =  false
        } else {
            sender.isOn =  true
        }
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
