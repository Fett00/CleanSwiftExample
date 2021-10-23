//
//  ScoreModel.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import Foundation

enum ScoreModel{
    
    enum ShowScore{
        
        struct Request {}
        
        struct Response {
            
            var scores:[Scores]
        }
        
        struct ViewModel {
            
            var scoresAndTime:[(String,String)]
        }
    }
    
    enum DeleteScore{
        
        struct Request {
            
            let indexPath: Int
        }
        
        struct Response {
            
            
        }
        
        struct ViewModel {
            
            
        }
    }
}
