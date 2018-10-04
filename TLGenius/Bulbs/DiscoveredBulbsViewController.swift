//
//  DiscoveredBulbsViewController.swift
//  TLGenius
//
//  Created by Apple on 8/29/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DiscoveredBulbsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!

    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    @IBOutlet weak var addBtn : UIButton!

    @IBOutlet weak var bulbsTblVw: UITableView!

    var bulbNamesArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addBtn.layer.cornerRadius = 25.0
        bulbsTblVw.tableFooterView = UIView()

        bulbNamesArr = ["Bulb 1","Bulb 2","Bulb 3","Bulb 4"];
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubsCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        cell.nameIdLbl.text = bulbNamesArr[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GoToBulbDetailsScreen", sender: self)
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
