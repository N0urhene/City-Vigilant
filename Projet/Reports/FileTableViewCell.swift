//
//  FileTableViewCell.swift
//  Projet
//
//  Created by nourhene on 09/04/2021.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet weak var fileLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
