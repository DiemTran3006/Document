//
//  TableViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class TableViewController: UIViewController {
    
    var model: [ModelTableView] = [ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis" ,
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
                                   ModelTableView(image: "image",
                                                  label1: "Iron Man: Extremis",
                                                  label2: "Tác giả: Warren Ellis",
                                                  label3: "Thể loại: Siêu Anh Hùng",
                                                  label4: "Lượt xem: 35.895.190"),
    ]
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Menu.tableView.title
        configTableView()
    }
    private func configTableView() {
        myTableView.separatorStyle = .none
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(cellType: TableViewCell.self)
    }
    
}
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(model: model[indexPath.row])
        return cell
    }
}
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

struct ModelTableView {
    let image : String
    let label1 : String
    let label2: String
    let label3: String
    let label4: String
}
