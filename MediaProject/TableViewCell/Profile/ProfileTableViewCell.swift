//
//  ProfileTableViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/12.
//

import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    
    let dataTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 15)
        view.textColor = Custom.Color.TitleColor
        
        return view
    }()
    
    let dataLabel: UILabel = {
        let view = UILabel()
        view.textColor = Custom.Color.lableColor
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    var titleText = ""
    var dataText = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        configureHierarchy()
        configureContraints()
    }
    
    func configureHierarchy() {
        contentView.addSubview(dataTitleLabel)
        contentView.addSubview(dataLabel)
    }
    
    func configureContraints() {
        print("dfd")
        dataTitleLabel.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        
        dataLabel.snp.makeConstraints { make in
            make.leading.equalTo(dataTitleLabel.snp.trailing)
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
    func configureCell() {
        dataTitleLabel.text = titleText
        dataLabel.text = dataText
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
