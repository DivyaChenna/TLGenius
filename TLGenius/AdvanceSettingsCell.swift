//
//  AdvanceSettingsCell.swift
//  TLGenius
//
//  Created by Apple on 9/25/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class AdvanceSettingsCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var lblSettingName: UILabel!
    
    @IBOutlet weak var lblSettingType: UILabel!
    
    @IBOutlet weak var onswitch: UISwitch!
    
    @IBOutlet weak var btnRemove: UIButton!
    
    @IBOutlet weak var btnReset: UIButton!
    
    @IBOutlet weak var stpView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.borderWidth = 1
        //bgView.layer.borderColor = UIColor.blue.cgColor
        bgView.layer.borderColor = UIColor.init(red: 43/255, green: 42/255, blue: 59/255, alpha: 1).cgColor
        
        btnReset.layer.cornerRadius = 15
        btnRemove.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
