//
//  GameFieldInteractor.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import Foundation

protocol GameFieldInteractorProtocol {
    
    func saveScore(request: GameFieldModel.ScoreCorrector.Request)
}

class GameFieldInteractor:GameFieldInteractorProtocol{
    
    var presenter: GameFieldPresenterProtocol!
    
    func saveScore(request: GameFieldModel.ScoreCorrector.Request) {
        
        let coreData = CoreDataWorker.init()
        coreData.add {
            
            let scores = Scores(context: coreData.context)
            let timeStamp = Date().timeIntervalSince1970
            scores.leftScore = Int32(request.lhs)
            scores.rightScore = Int32(request.rhs)
            scores.timeStamp = timeStamp
        }
    }
}
