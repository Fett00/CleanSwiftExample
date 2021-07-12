//
//  UIViewExt.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import UIKit

extension UIView{
    
    func addSubview(_ views:[UIView]){
        
        let _ = views.map { self.addSubview($0) }
    }
    
    class func massiveTranslateAutoresizingMaskIntoConstraint(_ views:[UIView]){
        
        let _ = views.map { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
