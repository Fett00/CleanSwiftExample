//
//  StartButton.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 12.07.2021.
//

import UIKit

class CustomButton:UIButton{
    
    init(bgColor: UIColor, title: String) {
        super.init(frame: .zero)
        
        configurateButton(color: bgColor, title: title)
    }
    
    init(){
        super.init(frame: .zero)
        
        configurateButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurateButton(color: UIColor = UIColor.secondarySystemBackground, title: String = ""){
        
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
    }
}
