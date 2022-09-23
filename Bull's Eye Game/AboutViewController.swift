//
//  AboutViewController.swift
//  Bull's Eye Game
//
//  Created by Vladimir on 08.09.2022.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(
            forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }
    
}


