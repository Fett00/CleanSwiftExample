//
//  MainRouter.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import UIKit

protocol MainRouterProtocol {
    
    func navigateToGameField()
    func navigateToViewWithGameData(view:UIViewController, data:MainModel.PassingData)
}

class MainRouter: MainRouterProtocol{
    
    weak var view:MainView!
    
    func navigateToGameField() {
        
        let gameField = GameFieldAssambler.assemble()
        
        view.navigationController?.pushViewController(gameField, animated: true)
        
    }
    
    func navigateToViewWithGameData(view: UIViewController, data: MainModel.PassingData) {
        
    }
    

}
