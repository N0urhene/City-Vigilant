//
//  FileReportCellCell.swift
//  Projet
//
//  Created by nourhene on 20/04/2021.
//

import UIKit

class FileReportCell: UITableViewCell {

    @IBOutlet weak var fileButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        fileButton.layer.cornerRadius = 12
       fileButton.layer.borderWidth = 1
        fileButton.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
