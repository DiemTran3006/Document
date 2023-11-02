//
//  UIWebViewViewController.swift
//  Document
//
//  Created by Diem Tran on 20/10/2023.
//

import UIKit
import WebKit

class UIWebViewViewController: UIViewController {
    var History:Array<String> = Array<String>()
    var vitri: Int = 0
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.stopAnimating()
        title = Menu.UIWebView.title
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func actionPopMenu(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popWebViewButton(_ sender: Any) {
        if History.count > 0 {
            vitri = vitri - 1
            if vitri < 0 {
                vitri = 0
            }
            print(History[vitri])
            let url = URL(string: History[vitri])!
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    
    @IBAction func pushWebView(_ sender: Any) {
        if History.count > 0 {
            vitri = vitri + 1
            if vitri > History.count - 1 {
                vitri = History.count - 1
            }
            print(History[vitri])
            let url = URL(string: History[vitri])!
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    @IBAction func actionReload(_ sender: Any) {
//        Reload lại Data
        webView.reload()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
        if let url = URL(string: searchTextfield.text ?? "") {
            var link: String = searchTextfield.text ?? ""
//         hasPrefix kiểm tra xem link có chứa đường dẫn "http://" && "https://"
            if link.hasPrefix("http://") || link.hasPrefix("https://") {
                let urlRequest = URLRequest(url: url)
                webView.load(urlRequest)
                History.append(link)
                webView.navigationDelegate = self
            } else {
                link = "https://\(link)"
                let url2 = URL(string: link)!
                let urlRequest = URLRequest(url: url2)
                webView.load(urlRequest)
                History.append(link)
                webView.navigationDelegate = self
            }
            vitri = History.count - 1
            print(History)
            print(vitri)
        } else {
            print("Khong Ton Tai Link")
        }
    }
}
extension UIWebViewViewController: WKNavigationDelegate {
//    Khi đã tải xong nội dung
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
//    Bắt đầu tải nội dung vào webView
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
}

