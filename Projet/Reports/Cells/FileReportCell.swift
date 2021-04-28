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
    var pic = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    @IBAction func fileAction(_ sender: Any) {
    }
    
    @IBAction func photoAction(_ sender: Any) {
        pic()
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        val()
    }
    
}
