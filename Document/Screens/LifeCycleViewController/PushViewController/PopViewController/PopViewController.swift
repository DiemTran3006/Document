//
//  PopViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class PopViewController: UIViewController {

    
    @IBAction func actionPop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        
    }

    @IBAction func popViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
