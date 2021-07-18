//
//  MainModel.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import Foundation

enum MainModel{
    
    enum Difficult{
        
        case easy
        case hard
    }
    
    enum Enemy{
        
        case Player2
        case AI
        case Bluetooth
    }
    
    struct Settings {
        
        var difficult: Difficult
        var enemy: Enemy
    }
    
    enum SaveSettings{
        
        struct Request {
            
            var difficult: Difficult?
            var enemy: Enemy?
            
        }
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum GetSettings{
        
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    struct PassingDataToGameField{
        
        let difficult:Difficult
        let enemy:Enemy
    }
    
}
