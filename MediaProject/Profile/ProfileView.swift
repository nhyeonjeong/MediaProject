//
//  ProfileView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/12.
//

import UIKit
import SnapKit

class ProfileView: BaseUIView {

    let profileImageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "person.fill"), for: .normal)
        view.tintColor = .white
        
        view.backgroundColor = Custom.Color.lableColor
        view.layer.cornerRadius = 50
        return view
    }()
    
    let profileTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.rowHeight = 40
        return view
    }()
    
    
    override func configureHierarchy() {
        addSubview(profileImageButton)
        addSubview(profileTableView)
    }
    
    override func configureConstraints() {
        profileImageButton.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        profileTableView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(profileImageButton.snp.bottom).offset(30)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

}
