//
//  TableViewCell.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameAnime: UILabel!
    @IBOutlet weak var nameAuthor: UILabel!
    @IBOutlet weak var catagory: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(model: ModelTableView ) {
        nameAnime.text = model.label1
        imageProfile.image = UIImage(named: model.image)
        nameAuthor.text = model.label2
        catagory.text = model.label3
        viewLabel.text = model.label4
    }
    
}
