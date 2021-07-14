//
//  ProjectAssembler.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import UIKit

protocol ProjectAssemblerProtocol {
    
    static func assemble() -> UITabBarController
}

class ProjectAssembler: ProjectAssemblerProtocol{
    
    static func assemble() -> UITabBarController {
        
        let tabBar = TabBarRouter()
        
        let firstItem = NavigationControllerRouter(rootViewController: MainAssambler.assemble()) // TabBarController Children
        let secondItem = NavigationControllerRouter(rootViewController: ScoreAssambler.assemble())// TabBarController Children
        
        firstItem.tabBarItem = UITabBarItem(title: "Play", image: SFSymbols.game, tag: 0)
        secondItem.tabBarItem = UITabBarItem(title: "Score", image: SFSymbols.score, tag: 1)
        
        tabBar.viewControllers = [firstItem,secondItem] // Add children
        
        return tabBar
    }
}
