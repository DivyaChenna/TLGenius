//
//  SendRequestViewController.swift
//  TLGenius
//
//  Created by Apple on 9/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Contacts

class SendRequestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate, UISearchBarDelegate{

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var NotifBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var bandBtn: UIButton!
    @IBOutlet weak var menuBtn : UIButton!
    @IBOutlet weak var sendRequestBtn: UIButton!
    @IBOutlet weak var requestsBtn : UIButton!

    @IBOutlet weak var sendBtn : UIButton!

    @IBOutlet weak var contactsTblVw : UITableView!

    @IBOutlet weak var searchBarr : UISearchBar!

    var contacts = [CNContact]()
    
    var contactFilteredList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contactsTblVw.tableFooterView = UIView()
        
        
        let font = UIFont(name: "Helvetica", size: 12.0)
        
        let defaultTextAttribs = [NSAttributedStringKey.font.rawValue: font, NSAttributedStringKey.foregroundColor.rawValue:UIColor.lightGray]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = defaultTextAttribs as Any as! [String : Any]
       
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.init(red: 34.0/255.0, green: 31.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
        
        // open it
        
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            guard granted else {
                DispatchQueue.main.async {
                }
                return
            }
            
            // get the contacts
            
            let request = CNContactFetchRequest(keysToFetch: [CNContactIdentifierKey as NSString, CNContactFormatter.descriptorForRequiredKeys(for: .fullName)])
            do {
                try store.enumerateContacts(with: request) { contact, stop in
                    self.contacts.append(contact)
                }
            } catch {
                print(error)
            }
            
            let formatter = CNContactFormatter()
            formatter.style = .fullName
            
//            self.contactFilteredList = self.contacts as NSString

            for contact in self.contacts {
                print(formatter.string(from: contact) ?? "???")
                DispatchQueue.main.async {
                    self.contactsTblVw.reloadData()
                }

            }
        }

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactFilteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SenseCell") as? HubsTableViewCell else {
            return UITableViewCell()
        }
        
        let contact = self.contacts[indexPath.row]

        let formatter = CNContactFormatter()
        cell.nameIdLbl.text = formatter.string(from: contact)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        let cell = tableView.cellForRow(at: indexPath)
        
        var selectedArr = [NSMutableArray]()
        
        
        if cell!.isSelected
        {
            cell!.isSelected = false
            if cell!.accessoryType == UITableViewCellAccessoryType.none {
                cell!.accessoryType = UITableViewCellAccessoryType.checkmark
            }
            else {
                cell!.accessoryType = UITableViewCellAccessoryType.none
                selectedArr.remove(at: indexPath.row)
            }
            
            print(selectedArr)
            
        }

    }

    func filterTableViewForEnterText(searchText: String) {
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        
        let array = (self.contacts as NSArray).filtered(using: searchPredicate)
        self.contactFilteredList = array as! [String]
        self.contactsTblVw.reloadData()
    }

    func searchDisplayController(_ controller: UISearchDisplayController,
                                 shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterTableViewForEnterText(searchText: self.searchDisplayController!.searchBar.text!)
        return true
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
    
    @IBAction func requestBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func bandBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func menuBtnClicked(sender: UIButton!) {
    }
    
    @IBAction func sendBtnClicked(sender: UIButton!) {
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
