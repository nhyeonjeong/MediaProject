//
//  BaseUIView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/03.
//

import UIKit

class BaseUIView: UIView, Configure {
    // Configure프로토콜을 따라서 뷰 구성에 필수적인 부분 구현

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Custom.Color.backgroundColor // 여기만 검은색하고 나머지는 clear
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
    }
    
    func configureConstraints() {
        
    }
    
    func configureView() {
    }
    
    
}
