//
//  DataPassingViewController.swift
//  Document
//
//  Created by Diem Tran on 24/10/2023.
//

import UIKit

class DataPassingViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emaiTextfield: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        passwordTextfield.addPadding(.left(15))
        emaiTextfield.addPadding(.left(15))
        title = Menu.dataPassing.title
        
    }
    @IBAction func actionButton(_ sender: Any) {
        let VC = DataDetailsViewController(nibName: "DataDetailsViewController", bundle: nil)
        VC.email = emaiTextfield.text ?? ""
        VC.password = passwordTextfield.text ?? ""
        self.navigationController?.pushViewController( VC, animated: true)
    }
}
