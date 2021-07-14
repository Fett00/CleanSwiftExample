//
//  MainAssambler.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import UIKit

protocol MainAssamblerProtocol: AnyObject {
    
    static func assemble() -> UIViewController
}

//Сборка основного экрана
class MainAssambler: MainAssamblerProtocol{
    
    static func assemble() -> UIViewController {
    
        
        let view = MainView()
        let presenter = MainPresenter()
        let interactor = MainInterctor()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
