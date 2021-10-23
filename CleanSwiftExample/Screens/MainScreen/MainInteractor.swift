//
//  MainScreenInteractor.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import Foundation


protocol MainInteractorProtocol: AnyObject {
    
    func saveSettings(setting:MainModel.SaveSettings.Request)
    
    //Можно ли так делать???
    func getSettings() -> MainModel.Settings
}

class MainInterctor: MainInteractorProtocol{
    
    var presenter: MainPresenterProtocol!
    
    var settings = MainModel.Settings(difficult: .easy, enemy: .Player2)
    
    func saveSettings(setting: MainModel.SaveSettings.Request) {
        
        settings.difficult = setting.difficult ?? settings.difficult
        settings.enemy = setting.enemy ?? settings.enemy
    }
    
    //Можно ли так делать??? Вроде нет
    func getSettings() -> MainModel.Settings {
        return settings
    }
    
}
