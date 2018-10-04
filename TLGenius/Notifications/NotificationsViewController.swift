//
//  NotificationsViewController.swift
//  TLGenius
//
//  Created by Apple on 9/25/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    
    @IBOutlet weak var notificationsTblVw: UITableView!

    var notificationsArr = [String]()
    var timeArr = [String]()
    var notifCountArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        notificationsTblVw.tableFooterView = UIView()

        notificationsArr = ["Emergency Notification","Subscription pack will be expired in 2 days Subscription pack will be expired in 2 days"]
        timeArr = ["10 hrs","10:00 am"]
        notifCountArr = ["3","1"]

        notificationsTblVw.estimatedRowHeight = 900;
        notificationsTblVw.rowHeight = UITableViewAutomaticDimension;

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.nameIdLbl.text = notificationsArr[indexPath.row]
        cell.dateLbl.text = timeArr[indexPath.row]
        cell.idLbl.text = notifCountArr[indexPath.row]

        

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        let cell = tableView.cellForRow(at: indexPath) as! HubsTableViewCell
//
//
//        let constraint = CGSize(width: cell.nameIdLbl.frame.size.width, height: 100)
//        var size = CGSize.zero
//
//        let context = NSStringDrawingContext()
//
//        let boundingBox: CGSize = (cell.nameIdLbl.text?.boundingRect(with: constraint, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: cell.nameIdLbl.font], context: context).size)!
//
//        size = CGSize(width: ceil(boundingBox.width), height: ceil(boundingBox.height))
//        print(size.height)
//
//        return size.height
//    }

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
