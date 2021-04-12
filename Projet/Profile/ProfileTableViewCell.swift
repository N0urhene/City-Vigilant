//
//  ProfileTableViewCell.swift
//  Projet
//
//  Created by nourhene on 09/04/2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
  
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.contentMode = .scaleAspectFit
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(with title: String, image: String) {
        labelView.text = title
        icon.image = UIImage(systemName: image)
    }
}
