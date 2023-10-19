//
//  PopViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class PopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Menu.lifeCycleViewController.title
        
    }

    @IBAction func popViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
