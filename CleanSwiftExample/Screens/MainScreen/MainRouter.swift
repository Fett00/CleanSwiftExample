//
//  MainRouter.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import UIKit

protocol MainRouterProtocol {
    
    func pushToGaneFieldWithData(data:MainModel.Settings)
}

class MainRouter: MainRouterProtocol{
    
    weak var view:MainView!
    
    func pushToGaneFieldWithData(data: MainModel.Settings) { // ДОБАВИТЬ ПЕРЕДАЧУ ДАННЫХ
        let gameField = GameFieldAssambler.assemble()
        
        view.navigationController?.pushViewController(gameField, animated: true)
    }
    

}
