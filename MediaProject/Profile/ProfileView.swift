//
//  ProfileView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/12.
//

import UIKit
import SnapKit

class ProfileView: BaseUIView {
    
    let profileImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 50
        view.image = UIImage(systemName: "person.fill")
        view.contentMode = .scaleAspectFill
        view.backgroundColor = Custom.Color.lableColor
        view.tintColor = .white
        return view
    }()
    
    let profileTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.rowHeight = 40
        return view
    }()
    
    
    override func configureHierarchy() {
        addSubview(profileImageView)
        addSubview(profileTableView)
    }
    
    override func configureConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        profileTableView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

}
