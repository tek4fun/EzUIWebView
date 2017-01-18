//
//  DetailBook.swift
//  EzUIWebView
//
//  Created by iOS Student on 1/16/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class DetailBook: UIViewController, UIWebViewDelegate{

    @IBOutlet weak var myActive: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!

    var urlString : NSString!
    var type : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlString.deletingPathExtension
        let fileext = urlString.pathExtension
        self.webView.delegate = self
        self.myActive.startAnimating()

        let urlpath = Bundle.main.path(forResource: title, ofType: fileext)!

//        switch type {
//        case "PDF":
//            urlpath = Bundle.main.path(forResource: urlString, ofType: "pdf")!
//        case "HTML":
//            urlpath = Bundle.main.path(forResource: urlString, ofType: "html")!
//        case "DOCX":
//            urlpath = Bundle.main.path(forResource: urlString, ofType: "docx")!
//        case "All":
//            let urlExt = NSURL(fileURLWithPath: urlString).pathExtension
//            print(urlExt)
//            if urlExt == "pdf" {
//                urlpath = Bundle.main.path(forResource: urlString, ofType: "pdf")!
//            }
//            if urlExt == "html" {
//                urlpath = Bundle.main.path(forResource: urlString, ofType: "html")!
//            }
//            if urlExt == "docx" {
//                urlpath = Bundle.main.path(forResource: urlString, ofType: "docx")!
//            }
//        default:
//            break
//        }
        let url: NSURL = NSURL.fileURL(withPath: urlpath) as NSURL
        let urlRequest = NSURLRequest(url: url as URL)
        self.webView.loadRequest(urlRequest as URLRequest)
    }
    @IBAction func getCurrentTime(_ sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScript(from: "hello();")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad")
        self.myActive.isHidden = true
        self.myActive.stopAnimating()
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("didStartLoad")
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("shouldStartLoadWith request")
        return true
    }
}
