//
//  FirebaseStorageViewController.swift
//  Document
//
//  Created by Diem Tran on 24/10/2023.
//

import UIKit
import Firebase
import FirebaseStorage


class FirebaseStorageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imageName: String!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Menu.firebaseStorage.title
    }
    
    @IBAction func actionPickImage(_ sender: Any) {
        //  Tạo picker
        let picker = UIImagePickerController()
        //  Config
        picker.sourceType = .photoLibrary
        picker.delegate = self
        //  Hiển thị
        present(picker, animated: true , completion: nil)
    }
    //  UIImagePickerControllerDelegate
    //  Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true , completion: nil)
    }
    //  Chọn ảnh
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //  Lấy ảnh
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        //  Tạo imageName
        let identifier = UUID()
        imageName = "\(Data())_\(identifier.uuidString).png"
        //  Đẩy vào image View
        imageView.image = image
        //  Ẩn picker
        picker.dismiss(animated: true , completion: nil)
    }
    
    @IBAction func actionUploadImage(_ sender: Any) {
        //  Tạo reference đến thư mục
        let reference = Storage.storage().reference(withPath: "Images")
        //  Lấy data ảnh + mata data ( bổ xung thêm thu nhỏ ảnh )
        let scaled = scaleImage(imageView.image!, fitSize: CGSize(width: 100, height: 100))
        let data = scaled.pngData()!
        let meta = StorageMetadata()
        meta.contentType = "image/png"
        //  Start các progress view . activity view
        activityIndicatorView.startAnimating()
        progressView.progress = 0
        //  Start task
        let task = reference.child(imageName).putData(data , metadata: meta) { (meta, error) in
            self.activityIndicatorView.stopAnimating()
            if let error = error {
                print(error)
            } else {
                print("Thành công")
            }
        }
        
        //  Theo dõi trạng thái task để cập nhật progress
        task.observe(.progress) { (snapshot) in
            if let complete = snapshot.progress?.completedUnitCount, let total = snapshot.progress?.totalUnitCount {
                self.progressView.progress = Float(complete) / Float(total)
            }
        }
        //   Phóng ảnh theo kích thước
      func scaleImage(_ image: UIImage, fitSize: CGSize) -> UIImage {
            //    Tính ratio
            let wRatio = fitSize.width / image.size.width
            let hRatio = fitSize.height / image.size.height
            let ratio = min( wRatio, hRatio)
            //   Size ảnh mới
            let  size = CGSize(width: image.size.width * ratio, height: image.size.height * ratio)
            //   Vẽ ảnh theo kích thước mới
            UIGraphicsBeginImageContext(size);
            image.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
            let scaleImage = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext();
            
            return scaleImage!;
        }
        
    }
    
    @IBAction func actionDowloadImage(_ sender: Any) {
        //  Tạo reference đến thư mục
        let reference = Storage.storage().reference(withPath: "Images")
        //  Start các progress view . activity view
        activityIndicatorView.startAnimating()
        progressView.progress = 0
        //  Start task
        let task = reference.child(imageName).getData(maxSize: Int64.max) { (data, error) in
            self.activityIndicatorView.stopAnimating()
            
            if let error = error {
                print(error)
            } else {
                self.imageView.image = UIImage(data: data!)
            }
        }
        //  Theo dõi trạng thái task để cập nhật progress
        task.observe(.progress) { (snapshot) in
            if let complete = snapshot.progress?.completedUnitCount, let total = snapshot.progress?.totalUnitCount {
                self.progressView.progress = Float(complete) / Float(total)
            }
        }
    }
}
