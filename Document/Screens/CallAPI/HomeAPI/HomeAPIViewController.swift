//
//  HomeAPIViewController.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import UIKit

class HomeAPIViewController: UIViewController {
    
    var home: [HomeAPIModel] = []
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(cellType: SampleTableViewCell.self )
        myTable.register(cellType: PhoneTableViewCell.self )
        myTable.register(cellType: TypePhoneTableViewCell.self )
    }
}
extension HomeAPIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as? SampleTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneTableViewCell" , for: indexPath) as? PhoneTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TypePhoneTableViewCell", for: indexPath) as? TypePhoneTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
}
//extension HomeAPIViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        if indexPath.section == 0 {
////            return
////        } else if indexPath.section == 1 {
////            return 40
////        } else {
////            return
////        }
//
//    }
//}
extension HomeAPIViewController: UITableViewDelegate {
    
}
