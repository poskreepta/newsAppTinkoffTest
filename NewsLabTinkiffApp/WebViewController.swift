//
//  WebViewController.swift
//  NewsLabTinkiffApp
//
//  Created by poskreepta on 14.03.23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    let webView = WKWebView()
    var newsURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = URL(string: newsURL) else {
            return
        }
        
        webView.load(URLRequest(url: url))

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    


}
