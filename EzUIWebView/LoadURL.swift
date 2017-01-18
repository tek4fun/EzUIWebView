//
//  LoadURL.swift
//  EzUIWebView
//
//  Created by iOS Student on 1/16/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class LoadURL: UIViewController,UITextFieldDelegate,UIWebViewDelegate {

    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var urlString: UITextField!
    @IBOutlet weak var webView: UIWebView!
    let baseUrl = "http://www."
    override func viewDidLoad() {
        myActivity.isHidden = true
        super.viewDidLoad()
        self.urlString.delegate = self
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        myActivity.isHidden = false
        let url = URL(string: baseUrl + textField.text!)!
        let urlRequest = URLRequest(url: url)
        self.webView.loadRequest(urlRequest)
        myActivity.startAnimating()
        return true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivity.isHidden = true
        myActivity.stopAnimating()
    }
   

}
