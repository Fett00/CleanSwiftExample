//
//  GameFieldView.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import UIKit
import SpriteKit

protocol GameFieldViewProtocol: AnyObject {
    
    //func changeCell(viewModel:) //Поставить в клетку X или О
}

class GameFieldView: UIViewController,GameFieldViewProtocol {
    
    var interactor: GameFieldInteractorProtocol!
    
    let scoreLable = UILabel()
    let gameView = SKView()
    let gameScene = SKScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        //Настройка игрвой сцены
        configurateGameScene()
        //Настройка лейбла со счетом
        configurateScoreLable()
        //Настройка поля
        configurateFields()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        //Сохранение счета в CD перед закрытием окна
        interactor.saveScore(request: GameFieldModel.ScoreCorrector.Request(lhs: Int.random(in: 0...10), rhs: Int.random(in: 0...10)))
    }
    
    //MARK: - Настройка игровой сцены
    
    func configurateGameScene(){
        
        view.addSubview(gameView)
        
        gameView.presentScene(gameScene)
        
        NSLayoutConstraint.activate([
        
            gameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            gameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            gameView.heightAnchor.constraint(equalTo: gameView.widthAnchor),
            gameView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        gameView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Настройка поля
    
    func configurateFields(){
        
    }
    
    
    //MARK: - Настройка лейбла со счетом
    
    func configurateScoreLable(){
        
        view.addSubview(scoreLable)
        
        scoreLable.text = "0 : 0"
        
        scoreLable.font = UIFont.boldSystemFont(ofSize: 40)
        scoreLable.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        scoreLable.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        scoreLable.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
        
            scoreLable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scoreLable.leadingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scoreLable.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 20)
        ])
        
        
        scoreLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
