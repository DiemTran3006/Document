//
//  SampleCollectionViewCell.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import UIKit
import AlamofireImage

class SampleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var banerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func configCell(model: PhoneTypeModel) {
        if let url = URL(string: model.img_url.asIntOrEmpty()) {
            banerImage.af.setImage(withURL: url)
        }
    }
}
