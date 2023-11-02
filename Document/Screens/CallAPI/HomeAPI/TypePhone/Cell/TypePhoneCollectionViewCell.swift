//
//  TypePhoneCollectionViewCell.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import UIKit

class TypePhoneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var typePhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configCell(model: ProducctModel) {
        typePhoneLabel.text = model.title
    }
    
}
