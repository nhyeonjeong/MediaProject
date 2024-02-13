//
//  ProfileDetailViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/13.
//

import UIKit
import SnapKit

class ProfileEditViewController: BaseViewController {
    
    var titleText = ""
    var dataText = ""
    
    var changeText: ((String) -> (String, String))?
    
    // self때문에 Lazy var
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.textColor = Custom.Color.TitleColor
        return view
    }()
    
    lazy var textfield: ProfileTextField = {
        let view = ProfileTextField()
        // 문자열을 dataText에 저장
        if let changeText {
            (titleText, dataText) = changeText("") // 튜플
        } else {
            print("changeText함수가 nil")
            dataText = "-"
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 여기는 배경색이 있어야 홤녀전환 될 때 안 어색
        view.backgroundColor = Custom.Color.backgroundColor
        
        navigationItem.title = titleText
        
        view.addGestureRecognizer(tapGesture)
        view.endEditing(true)
        
        configureTextField()
    }
    
    @objc
    func viewClicked() {
        view.endEditing(true)
    }
    
    @objc
    func xbuttonClicked() {
        textfield.text = ""
        textfield.placeholder = dataText

    }
    
    @objc
    func rightBarButtonItemClicked() {
//        if textfield.text! == "" {
//          필요없음 어차피 ㄹ옵셔널 아님
//        }
        _ = changeText?(textfield.text!)
        navigationController?.popViewController(animated: true)
    }

    override func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(textfield)
        view.addSubview(xbutton)
    }
    
    
    override func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
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
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(xbutton.snp.leading).inset(10)
        }
    }
    override func configureView() {

        // 네비게이션바아이템버튼
        let button = UIBarButtonItem(image: Custom.ImageStyle.navigationItemCheck, style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        
        navigationItem.rightBarButtonItem = button
        
        titleLabel.text = titleText
        textfield.text = dataText

    }
}

extension ProfileEditViewController: UITextFieldDelegate {
    func configureTextField() {
        print("df")
        textfield.delegate = self
        
    }
    
    // 키보드 return키나 엔터 누르면 키보드 내려감
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        view.endEditing(true)
        return true
    }

}


