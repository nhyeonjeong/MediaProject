//
//  ProfileDetailViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/13.
//

import UIKit
import SnapKit

class ProfileDetailViewController: BaseViewController {
    
    var dataText = ""
    
//    var placeholderText {
//        "\(dataText) 추가"
//    }
//    
    let dataLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.textColor = Custom.Color.lableColor
        return view
    }()
    
    lazy var textfield: ProfileTextField = {
        let view = ProfileTextField()
        view.attributedPlaceholder = NSAttributedString(string: dataText, attributes: [.foregroundColor: Custom.Color.placeholderColor])
        view.textColor = Custom.Color.TitleColor
        return view
    }()
    
    // lazy로 안해주면 addTarget - self에서 노란 오류
    // VC인스턴스 생성 전이라서..
    lazy var xbutton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        view.tintColor = Custom.Color.placeholderColor
        view.addTarget(self, action: #selector(xbuttonClicked), for: .touchUpInside)
        return view
    }()
    
    override func configureHierarchy() {
        view.addSubview(dataLabel)
        view.addSubview(textfield)
        view.addSubview(xbutton)
    }
    
    @objc
    func xbuttonClicked() {
        textfield.text = ""
        textfield.placeholder = dataText
    }

    override func configureConstraints() {
        dataLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(20)
        }
        
        xbutton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(textfield.snp.top)
//            make.size.equalTo(30)
            make.bottom.equalTo(textfield.snp.bottom)
            make.width.equalTo(xbutton.snp.height)
            
        }
        
        textfield.snp.makeConstraints { make in
            make.top.equalTo(dataLabel.snp.bottom).offset(10)
            make.leading.equalTo(dataLabel)
            make.trailing.equalTo(xbutton.snp.leading).inset(10)
        }
    }
    override func configureView() {
        navigationItem.title = dataText
        dataLabel.text = dataText
        textfield.placeholder = dataText
        // 여기는 배경색이 있어야 홤녀전환 될 때 안 어색
        view.backgroundColor = Custom.Color.backgroundColor
    }
}
