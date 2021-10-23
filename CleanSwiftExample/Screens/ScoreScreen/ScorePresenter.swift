//
//  ScorePresenter.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import Foundation

protocol ScorePresenterProtocol: AnyObject {
    
    func prepearToShowScores(response: ScoreModel.ShowScore.Response)
}

class ScorePresenter: ScorePresenterProtocol {
    
    weak var view:ScoreViewProtocol!
    
    func prepearToShowScores(response: ScoreModel.ShowScore.Response) {
        
        let scores = response.scores.map{ "\($0.leftScore) : \($0.rightScore)" }
        let times:[String] = response.scores.map{
            
            let date = Date(timeIntervalSince1970: $0.timeStamp)
            let formater = DateFormatter()
            formater.dateFormat = "YYY MMM d H:mm"
            return formater.string(from: date)
        }
        
        var tmpData = [(String,String)]()
        
        for i in 0..<min(scores.count, times.count){
            tmpData.append((scores[i],times[i]))
        }
        
        let viewModel = ScoreModel.ShowScore.ViewModel(scoresAndTime: tmpData)
        
        view.showScore(viewModel: viewModel)
    }
}
