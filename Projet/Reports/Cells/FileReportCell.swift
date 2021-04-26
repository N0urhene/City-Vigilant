//
//  FileReportCellCell.swift
//  Projet
//
//  Created by nourhene on 20/04/2021.
//

import UIKit

class FileReportCell: UITableViewCell {

    @IBOutlet weak var fileLabel: UILabel!
    
    var val = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    @IBAction func cameraAction(_ sender: Any) {
//        openCamera()
        val()
    }
    
}
