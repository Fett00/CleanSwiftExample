//
//  GameFieldModel.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 18.07.2021.
//

import Foundation


enum GameFieldModel{
    
    enum ChangeCell{
        
        struct Request {
            
        }
        
        struct Response {
            
        }
        
        struct ViewModel {
            
            let sign:Sign
        }
        
        enum Sign{
            
            case Noughts
            case Crosses
        }
    }
    
    enum ScoreCorrector{
        
        struct Request {
            
            let lhs: Int
            let rhs: Int
        }
    }
    
}
