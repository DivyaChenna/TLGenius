//
//  HubsTableViewCell.swift
//  TLGenius
//
//  Created by Apple on 8/22/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HubsTableViewCell: UITableViewCell {

    @IBOutlet var nameIdLbl: UILabel!
    @IBOutlet var idLbl: UILabel!
    @IBOutlet var signalImgVw: UIImageView!
    
    
    @IBOutlet var bandNameLbl: UILabel!
    @IBOutlet var userNameLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var remainingLbl: UILabel!

    @IBOutlet var menuDotsBtn: UIButton!
    @IBOutlet var bulbBtn: UIButton!
    @IBOutlet var deleteBtn: UIButton!
    @IBOutlet var editBtn: UIButton!
    @IBOutlet var tickBtn: UIButton!

    @IBOutlet var alertSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
