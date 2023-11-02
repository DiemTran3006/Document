//
//  PhoneTableViewCell.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import UIKit

class PhoneTableViewCell: UITableViewCell {
    var phoneData: [DataModel] = []
    @IBOutlet weak var myCollectionPhone: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionPhone.dataSource = self
        myCollectionPhone.delegate = self
        myCollectionPhone.register(cellType: PhoneCollectionViewCell.self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
extension PhoneTableViewCell: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        phoneData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhoneCollectionViewCell", for: indexPath) as? PhoneCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell(model: phoneData[indexPath.row])
        return cell
    }
}
extension PhoneTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = phoneData[indexPath.row].name!.widthOfString(usingFont: .systemFont(ofSize: 14))
        return CGSize(width: width + 30,
                      height: collectionView.frame.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}

