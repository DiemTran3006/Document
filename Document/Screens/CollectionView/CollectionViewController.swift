//
//  CollectionViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var collection : [ModelCollectionView] = [ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1) ),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.969, green: 0.816, blue: 0.639, alpha: 1)),
                                              ModelCollectionView(label1: "Tiên Hiệp",
                                                                  label2: "1323 truyện",
                                                                  color: UIColor(red: 0.525, green: 0.765, blue: 0.878, alpha: 1)),
    ]
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    private let flowLayout = UICollectionViewFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Menu.collectionView.title
        ConfigCollectionView()
    }
    
    private func ConfigCollectionView() {
        
//        flowLayout.minimumLineSpacing = 20
//        flowLayout.minimumInteritemSpacing = 0
//        myCollectionView.collectionViewLayout = flowLayout
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(cellType: CollectionViewCell.self )
    }
}
extension CollectionViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell(model: collection[indexPath.row])
        return cell
    }
    
    
}
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 20 - 20) / 2
        return CGSize(width: width, height: width * 55 / 160 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

struct ModelCollectionView {
    let label1: String
    let label2: String
    let color: UIColor
}
