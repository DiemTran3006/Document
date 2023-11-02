//
//  TypePhoneTableViewCell.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import UIKit

class TypePhoneTableViewCell: UITableViewCell {
    
    var typePhone: [ProducctModel] = []
    
    @IBOutlet weak var myCollectionTypePhone: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionTypePhone.dataSource = self
        myCollectionTypePhone.delegate = self
        myCollectionTypePhone.register(cellType: TypePhoneCollectionViewCell.self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
}
extension TypePhoneTableViewCell: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        typePhone.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypePhoneCollectionViewCell", for: indexPath) as? TypePhoneCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell(model: typePhone[indexPath.row])
        return cell
    }
}
extension TypePhoneTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 24 - 20) / 2
        return CGSize(width: width,
                      height: width * 82 / 165)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
