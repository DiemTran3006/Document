//
//  RegisterViewController.swift
//  Document
//
//  Created by Diem Tran on 26/10/2023.
//

import UIKit
import Photos
import Toast_Swift
import MaterialComponents
import AlamofireImage
import Alamofire

final class RegisterViewController: BaseViewController {
    
    var linkImage: String = ""
    var activeField: UITextField?
    var lastOffset: CGPoint?
    let photoPickerManager = PhotoPickerManager.shared
    
    @IBOutlet weak var nameTextfield: MDCOutlinedTextField!
    @IBOutlet weak var errorName: UIView!
    @IBOutlet weak var emailTextfield: MDCOutlinedTextField!
    @IBOutlet weak var errorEmail: UIView!
    @IBOutlet weak var passwordTextfield: MDCOutlinedTextField!
    @IBOutlet weak var errorPassword: UIView!
    @IBOutlet weak var confirmPasswordTextField: MDCOutlinedTextField!
    @IBOutlet weak var errorConfirmPassword: UIView!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        passwordTextfield.enablePasswordToggle()
        confirmPasswordTextField.enablePasswordToggle()
        settingAttrLabel()
        checkvalidate()
        viewCheckFormat()
        handleKeyboard()
        customTextField()
        actionProfireImage()
        photoPickerManager.checkPermissions(view: self)
        photoPickerManager.delegate = self
    }
    
    @IBAction func changedNameTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    @IBAction func changedEmailTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    @IBAction func changedPasswordTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    @IBAction func changedConfirmPasswordTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    @IBAction func actionPushLoginButton(_ sender: Any) {
        let VC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        VC.email = emailTextfield.text ?? ""
        VC.password = passwordTextfield.text ?? ""
        self.navigationController?.pushViewController( VC, animated: true)
    }
    
    @IBAction func actionPopLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionCameraButton(_ sender: Any) {
        photoPickerManager.cameraAction(view: self)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        photoPickerManager.galleryAction(view: self)
    }
    
    @IBAction func starButton(_ sender: Any) {
        
        guard linkImage != "" else {
            return self.view.makeToast("Bạn chưa chọn ảnh avatar", position: .bottom)
        }
        let param: RegisterRequest = RegisterRequest(email: emailTextfield.text.asStringOrEmpty(),
                                                     password: passwordTextfield.text.asStringOrEmpty(),
                                                     user_name: nameTextfield.text.asStringOrEmpty(),
                                                     ip_register: AppConstant.modelName.asStringOrEmpty(),
                                                     device_register: AppConstant.IPAddress.asStringOrEmpty(),
                                                     link_avatar: linkImage
        )
        APIFetchManager.shared.register(param: param) { [weak self] apiData in
            guard let self = self else { return }
            self.handerRegister()
            self.view.makeToast(apiData.message , position: .bottom)
        } handlerError: { error in
            self.view.makeToast(error , position: .bottom)
        }
    }
    
    private func handerRegister() {
        self.presentConfirmationAlert(title: "Register",
                                      message: "Do you want to continue registering?",
                                      okOption: "Continue",
                                      cancelOption: "Cancel") {
            self.navigateToLogin()
        } cancelCallback: {}
    }
    
    private func actionProfireImage() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    private func settingAttrLabel() {
        let attrText = NSMutableAttributedString.getAttributedString(fromString: "By registering, you agree to our Terms of Service")
        attrText.apply(color: UIColor(hexString: "#294E68"), subString: "Terms of Service")
        serviceLabel.attributedText = attrText
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabelProvision(tap:)))
        serviceLabel.addGestureRecognizer(tap)
        serviceLabel.isUserInteractionEnabled = true
    }

    @objc func tapLabelProvision(tap: UITapGestureRecognizer) {
    }
    
    private func navigateToLogin() {
        let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        viewController.email = emailTextfield.text ?? ""
        viewController.password = passwordTextfield.text ?? ""
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension RegisterViewController: PhotoPickerProtocol {

    func choosePhotoSuccess(image: UIImage) {
        profileImage.image = image
        let imageData = image.jpegData(compressionQuality: 0.5) ?? Data()
        
        let request = UploadImageReques(image: imageData,
                                        key: "a07b4b5e0548a50248aecfb194645bac")
        APIFetchManager.shared.upLoadImage(param: request) { apiData in
            self.linkImage = apiData.data.url
        } handlerError: { error in
            print(error)
        }
    }
}
