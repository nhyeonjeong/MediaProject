//
//  TVVideoViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/14.
//

import UIKit
import WebKit

class TVVideoViewController: BaseViewController {
    
    var url = ""
    let youtubeView = WKWebView()
    
    override func loadView() {
        view = youtubeView
        view.backgroundColor = Custom.Color.backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadVideo()
    }
    
    func loadVideo() {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            youtubeView.load(request)
        } else {
            dismiss(animated: true) // 유효한 URl이 아니면 dismiss
        }
    }
}
