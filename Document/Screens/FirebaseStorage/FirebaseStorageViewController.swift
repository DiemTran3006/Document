//
//  FirebaseStorageViewController.swift
//  Document
//
//  Created by Diem Tran on 24/10/2023.
//

import UIKit

class FirebaseStorageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Menu.firebaseStorage.title
    }

    @IBAction func actionPickImage(_ sender: Any) {
//        tạo picker
        let picker = UIImagePickerController()
//        config
        picker.sourceType = .photoLibrary
        picker.delegate = self
//        Hiển thị
        present(picker, animated: true , completion: nil)
    }
//    Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true , completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        picker.dismiss(animated: true , completion: nil)
    }
    
    
    @IBAction func actionUploadImage(_ sender: Any) {
        
    }
    
    @IBAction func actionDowloadImage(_ sender: Any) {
        
    }
    
}
