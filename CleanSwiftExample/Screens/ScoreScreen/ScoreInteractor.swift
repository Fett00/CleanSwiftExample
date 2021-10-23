//
//  ScoreInteractor.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import Foundation

protocol ScoreInteractorProtocol: AnyObject {
    
    func fetchScores(request:ScoreModel.ShowScore.Request)
    func deleteScore(request: ScoreModel.DeleteScore.Request)
}

class ScoreInterctor: ScoreInteractorProtocol{
    
    var presenter:ScorePresenterProtocol!
    
    let coreDataHelper = CoreDataWorker<Scores>()
    
    var scores = [Scores]()
    
    //Показать все счета
    func fetchScores(request: ScoreModel.ShowScore.Request) {
        
        
        scores = coreDataHelper.get(withCondition: nil, withLimit: nil)
        
        presenter.prepearToShowScores(response: ScoreModel.ShowScore.Response(scores: scores))
    }
    
    //Удалть счет
    func deleteScore(request: ScoreModel.DeleteScore.Request){
        
        coreDataHelper.delete(withCondition: ("timeStamp", String(scores[request.indexPath].timeStamp)))
    }
}


