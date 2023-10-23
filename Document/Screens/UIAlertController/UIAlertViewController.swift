//
//  UIAlertViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class UIAlertViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Menu.UIAlert.title
    }
    
    @IBAction func oneButton(_ sender: Any) {
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func twoButton(_ sender: Any) {
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertController.Style.alert)

           alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
           alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    
    @IBAction func threeButton(_ sender: Any) {
        let alert = UIAlertController(title: "Notice", message: "Lauching this missile will destroy the entire universe. Is this what you intended to do?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Remind Me Tomorrow", style: UIAlertAction.Style.default, handler: { [self]_ in self.xuly()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Launch the Missile", style: UIAlertAction.Style.destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
    func xuly() {
        print("hello")
    }
}
