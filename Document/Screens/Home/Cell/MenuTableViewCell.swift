//
//  MenuTableViewCell.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        backgroundColor = .clear
        containerView.withBorder(width: 1,
                                 cornerRadius: 8,
                                 color: .gray)
        titleLabel.textColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(model: Menu) {
        titleLabel.text = model.title
    }
    
}
