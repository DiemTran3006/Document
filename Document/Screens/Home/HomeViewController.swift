//
//  HomeViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var menus: [Menu] = Menu.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        configTableView()
    }

    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(cellType: MenuTableViewCell.self)
    }

}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        menus.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell",
                                                       for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(model: menus[indexPath.row])
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        switch menus[indexPath.row] {
        case .lifeCycleViewController:
            let controller = PushViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .collectionView:
            let controller = CollectionViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .tableView:
            let controller = TableViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .UIAlert:
            let controller = UIAlertViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .UITimePicker:
            let controller = UITimePickerViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .UIDatePicker:
            let controller = UIDatePickerViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .UIWebView:
            let controller = UIWebViewViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        case .loginSocial:
            let controller = LoginSocialViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}

enum Menu: CaseIterable {
    case lifeCycleViewController
    case tableView
    case collectionView
    case UIAlert
    case UITimePicker
    case UIDatePicker
    case UIWebView
    case loginSocial
    
    
    var title: String {
        switch self {
        case .lifeCycleViewController:
            return "Life Cycle ViewController"
        case .tableView:
            return "Table View"
        case .collectionView:
            return "Collection View"
        case .UIAlert:
            return "UIAlert"
        case .UITimePicker:
            return "UITimePicker"
        case .UIDatePicker:
            return "UIDatePicker"
        case .UIWebView:
            return "UIWebView"
        case .loginSocial:
            return "LoginSocial"
        }
    }
}
