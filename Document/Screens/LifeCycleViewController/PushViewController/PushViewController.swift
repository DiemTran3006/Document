//
//  PushViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class PushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Menu.lifeCycleViewController.title
        print("LifeCycleViewController : View DidLoad")
    }
    override func viewDidLayoutSubviews() {
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("LifeCycleViewController : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("LifeCycleViewController : viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("LifeCycleViewController : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("LifeCycleViewController : viewDidDisappear")
    }

    @IBAction func actionPushViewController(_ sender: Any) {
        let VC = PopViewController(nibName: "PopViewController", bundle: nil)
        self.navigationController?.pushViewController( VC , animated: true)
        
    }
}
