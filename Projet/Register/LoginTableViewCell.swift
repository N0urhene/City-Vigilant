//
//  LoginTableViewCell.swift
//  Projet
//
//  Created by nourhene on 19/04/2021.
//

import UIKit

class LoginTableViewCell: UITableViewCell {

    @IBOutlet weak var loginBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loginBtn.layer.cornerRadius = 12
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
