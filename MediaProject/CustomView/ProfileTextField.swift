//
//  ProfileTextField.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/12.
//

import UIKit

/// 프로필 화면에 들어갈 textField
class ProfileTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        
    }
    
    func configureView() {
        self.borderStyle = .none
        textColor = Custom.Color.PointColor
    }
    
    // 스토리보드로 할 때 실행되는 구문
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //        configureView() // 스토리보드로 한다면 여기도 configureView호출
        print("textfield required init")
    }
    
}
