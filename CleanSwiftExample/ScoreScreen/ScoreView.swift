//
//  ScoreView.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 13.07.2021.
//

import UIKit

protocol ScoreViewProtocol: AnyObject {
    
    func showScore(viewModel: ScoreModel.ShowScore.ViewModel)
    
}

//Сборка экрана со счетом
class ScoreView: UIViewController, ScoreViewProtocol, UITableViewDataSource {
    
    var interactor: ScoreInteractorProtocol!
    
    var scores = [(String,String)]()
    
    let scoreTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Recent score"
        view.backgroundColor = .systemBackground
        
        configurateTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchScores()
    }
    
    //MARK: - Настройка таблицы
    
    func configurateTableView(){
        
        view.addSubview(scoreTableView)
        
        scoreTableView.dataSource = self
        scoreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        scoreTableView.tableFooterView = UIView()
        
        NSLayoutConstraint.activate([
        
            scoreTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoreTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scoreTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scoreTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scoreTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Запрос интерактору на получение счетов(?)
    
    func fetchScores(){
        let request = ScoreModel.ShowScore.Request(state: .show)
        interactor.fetchScores(request: request)
    }
    
    //MARK: - Запрос интерактору на удаление счета
    //Пока нет реализации
    func deleteScore(){
        
    }
    
    //MARK: - Получение данных от презентера
    
    func showScore(viewModel: ScoreModel.ShowScore.ViewModel) {
        
        scores = viewModel.scoresAndTime
        scoreTableView.reloadData()
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = scores[indexPath.row].0
        content.secondaryText = scores[indexPath.row].1
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    //MARK: - UITableViewSwipeAction
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let swipeAction = UIContextualAction(style: .destructive, title: "Delete"){ (swipeAction,view,completationHandler) in
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [swipeAction])
    }
}
