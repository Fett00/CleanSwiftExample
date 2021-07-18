//
//  ScoreInteractor.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import Foundation

protocol ScoreInteractorProtocol: AnyObject {
    
    func fetchScores(request:ScoreModel.ShowScore.Request)
}

class ScoreInterctor: ScoreInteractorProtocol{
    
    var presenter:ScorePresenterProtocol!
    
    let coreDataHelper = CoreDataWorker<Scores>()
    
    func fetchScores(request: ScoreModel.ShowScore.Request) {
    
        switch request.state{
            
        case .show:
            showScores()
            
        case .delete:
            deleteScore()
        }
    }
    
    //Показать все счета
    func showScores(){
        
        let scores = coreDataHelper.get(withCondition: nil, withLimit: nil)
        
        presenter.prepearToShowScore(response: ScoreModel.ShowScore.Response(scores: scores))
    }
    
    //Удалть счет
    func deleteScore(){
        
    }
    
}
