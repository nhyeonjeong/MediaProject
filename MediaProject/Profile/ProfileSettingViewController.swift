//
//  ProfileSettingViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/14.
//

import UIKit

class ProfileSettingViewController: BaseViewController {

    let mainView = ProfileSettingUIView()
    
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
    
    override func loadView() {
        view = mainView
        view.addGestureRecognizer(tapGesture)
        view.backgroundColor = Custom.Color.backgroundColor
        navigationItem.title = "이미지 검색"

        configureSearchBar()
    }
    
    @objc
    func viewClicked() {
        view.endEditing(true)
    }
    

}

extension ProfileSettingViewController: UISearchBarDelegate {
    func configureSearchBar() {
        mainView.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
