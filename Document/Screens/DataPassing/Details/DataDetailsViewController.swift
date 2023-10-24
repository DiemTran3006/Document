//
//  DataDetailsViewController.swift
//  Document
//
//  Created by Diem Tran on 24/10/2023.
//

import UIKit

class DataDetailsViewController: UIViewController {
    
    var email = ""
    var password = ""
    

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = "Email: \(email)"
        passwordLabel.text = "Password: \(password)"
        
    }

}
