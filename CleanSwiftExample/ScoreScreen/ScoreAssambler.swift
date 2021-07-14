//
//  File.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import UIKit

protocol ScoreAssamblerProtocol: AnyObject {
    
    static func assemble() -> UIViewController
}


class ScoreAssambler: ScoreAssamblerProtocol{
    
    static func assemble() -> UIViewController {
        
        let view = ScoreView()
        let presenter = ScorePresenter()
        let interactor = ScoreInterctor()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}


