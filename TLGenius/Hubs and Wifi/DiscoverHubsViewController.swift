//
//  DiscoverHubsViewController.swift
//  TLGenius
//
//  Created by Apple on 8/22/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DiscoverHubsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var hubListTblVw: UITableView!
    
    @IBOutlet weak var popupVw: UIView!
    @IBOutlet weak var mainVw: UIView!

    @IBOutlet weak var hubNameLbl: UILabel!

    var hubNamesArr = [String]()
    var hubIDArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        hubNamesArr = ["Genius Hub","Popus","Right Down Area","Choice"]
        hubIDArr = ["MAC ID - 12D34","MAC ID - 14554","MAC ID - 14556","MAC ID - 67775"]

    }

    override func viewWillAppear(_ animated: Bool) {
        popupVw.isHidden = true
        mainVw.isHidden = false

    }
    
    @IBAction func backBtnClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubsCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }

        cell.nameIdLbl.text = hubNamesArr[indexPath.row]
        cell.idLbl.text = hubIDArr[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        mainVw.isHidden = true
        popupVw.isHidden = false
        hubNameLbl.text = hubNamesArr[indexPath.row]
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DiscoverHubsViewController.push), userInfo: nil, repeats: false)

    }

    @objc func push() {
        self.performSegue(withIdentifier:"GoToWifiListScreen", sender: self)
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
