//
//  CollectionViewCell.swift
//  Document
//
//  Created by Diem Tran on 19/10/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleNameAnime: UILabel!
    @IBOutlet weak var titleNumberStory: UILabel!
    @IBOutlet weak var viewColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configCell(model: ModelCollectionView) {
        titleNameAnime.text = model.label1
        titleNumberStory.text = model.label2
        viewColor.backgroundColor = model.color
  
    }
   
}
