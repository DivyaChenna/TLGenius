//
//  CreateGroupViewController.swift
//  TLGenius
//
//  Created by Apple on 8/31/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!
    @IBOutlet weak var addBtn : UIButton!
    
    @IBOutlet weak var nextBtn : UIButton!
    
    @IBOutlet weak var listTblVw : UITableView!

    var sectionNames = [NSString]()
    var selectedIndex: Int?
    var selectedRows = [String:NSIndexPath]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextBtn.layer.cornerRadius = 17.0
        sectionNames = ["Living Room","Kitchen","Others"]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section] as String
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubsCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        if selectedIndex == indexPath.row {
            cell.nameIdLbl.textColor = UIColor.red
            
        } else {
            cell.nameIdLbl.textColor = UIColor.lightGray
            
        }

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: UIView = UIView.init(frame: CGRect(x:1, y:50, width:276, height:40));
        headerView.backgroundColor = UIColor(red: 28/255.0, green: 23/255.0, blue: 53/255.0, alpha: 1.0)
        
        let labelView: UILabel = UILabel.init(frame: CGRect(x:4, y:5, width:276, height:20))
        labelView.text = sectionNames[section] as String
        labelView.textColor = UIColor(red: 0/255.0, green: 158/255.0, blue: 212/255.0, alpha: 1.0)
        headerView.addSubview(labelView)

        return headerView
    }
    
    func addSelectedCellWithSection(indexPath:NSIndexPath) ->NSIndexPath?
    {
        let existingIndexPath = selectedRows["\(indexPath.section)"];
        if (existingIndexPath == nil) {
            selectedRows["\(indexPath.section)"]=indexPath;
        }else
        {
            selectedRows["\(indexPath.section)"]=indexPath;
            return existingIndexPath
        }
        
        return nil;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = listTblVw.cellForRow(at: indexPath as IndexPath) as! HubsTableViewCell
        
        let previusSelectedCellIndexPath = self.addSelectedCellWithSection(indexPath: indexPath as NSIndexPath)
        
        if(previusSelectedCellIndexPath != nil)
        {
            let previusSelectedCell = listTblVw.cellForRow(at: previusSelectedCellIndexPath! as IndexPath) as! HubsTableViewCell
            
            previusSelectedCell.nameIdLbl.textColor = UIColor(red: 72/255.0, green: 70/255.0, blue: 79/255.0, alpha: 1.0)

            cell.nameIdLbl.textColor = UIColor.white
            tableView.deselectRow(at: previusSelectedCellIndexPath! as IndexPath, animated: true)
        }
        else
        {
            cell.nameIdLbl.textColor = UIColor.white
        }
        
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
    
    
    @IBAction func nextBtnClicked(sender: UIButton!) {
        self.performSegue(withIdentifier: "GoToCreateGroup1Screen", sender: self)
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
