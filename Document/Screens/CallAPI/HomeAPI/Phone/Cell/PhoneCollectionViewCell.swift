//
//  PhoneCollectionViewCell.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import UIKit

class PhoneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var namePhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func configCell(model: DataModel) {
        namePhoneLabel.text = model.name
    }
}
