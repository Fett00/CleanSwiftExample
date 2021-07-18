//
//  GameFieldAssambler.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 18.07.2021.
//

import UIKit


protocol GameFieldAssamblerProtocol: AnyObject {
    
    static func assemble() -> UIViewController
}


class GameFieldAssambler: ScoreAssamblerProtocol{
    
    static func assemble() -> UIViewController {
        
        let view = GameFieldView()
        let presenter = GameFieldPresenter()
        let interactor = GameFieldInteractor()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
