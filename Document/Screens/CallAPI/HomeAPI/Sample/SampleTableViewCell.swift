//
//  SampleTableViewCell.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    
    var sample : [PhoneTypeModel] = []
    
    @IBOutlet weak var myCollectionSample: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionSample.dataSource = self
        myCollectionSample.delegate = self
        myCollectionSample.register(cellType: SampleCollectionViewCell.self)
        
//        APIFetchManager.shared.sample { apiData in
//            self.sample = apiData
//        } handlerError: { error in
//            <#code#>
//        }

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func sample(Sample2: [PhoneTypeModel]) {
        self.sample = Sample2
    }
}
extension SampleTableViewCell: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sample.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCollectionViewCell", for: indexPath) as? SampleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell(model: sample[indexPath.row])
        return cell
    }
}
extension SampleTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width - 130
        return CGSize(width: width,
                      height: width * 125 / 245)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
