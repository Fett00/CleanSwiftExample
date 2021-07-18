//
//  MainScreenView.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    
    
}

class MainView: UIViewController, MainViewProtocol {
    
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    //Картинки над выбором соперника
    let enemyLabelsBlock = UIStackView()
    //Выбор соперника
    let enemyPicker = UISegmentedControl()
    
    //Таблица с выбором настроек(МБ в будущем)
    //let settingsCollectionView = UICollectionView()
        
    //Надпись над выбором сложности ИИ
    let computerDifficultLable = UILabel()
    //Выбор сложности ИИ
    let computerDifficultPicker = UISegmentedControl()
    
    //Кнопка запуска игры
    let startButton = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        //Настройка выбора соперника
        configurateEnemyPickerBlock()
        //Настройка настроек :)
        configurateSettingsBlock()
        //Настройка кнопки наала игры
        configurateButton()
    }
    
    //MARK: - Настройка блока с выбором соперника
    
    func configurateEnemyPickerBlock(){
        
        view.addSubview([
            
            enemyLabelsBlock,
            enemyPicker
        ])
        
        //Настройка картинок над выбором соперника
        let playerImage = UIImageView(image: Images.secondPlayer)
        let computerPlayerImage = UIImageView(image: Images.computerPlayer)
        let bluetoothPlayerImage = UIImageView(image: Images.bluetoothPlayer)
        
        playerImage.contentMode = .scaleAspectFit
        computerPlayerImage.contentMode = .scaleAspectFit
        bluetoothPlayerImage.contentMode = .scaleAspectFit
        
        playerImage.tintColor = .secondaryLabel
        computerPlayerImage.tintColor = .secondaryLabel
        bluetoothPlayerImage.tintColor = .secondaryLabel
        
        enemyLabelsBlock.addArrangedSubview(playerImage)
        enemyLabelsBlock.addArrangedSubview(computerPlayerImage)
        enemyLabelsBlock.addArrangedSubview(bluetoothPlayerImage)
        
        enemyLabelsBlock.axis = .horizontal
        enemyLabelsBlock.alignment = .fill
        enemyLabelsBlock.distribution = .fillProportionally
        //
        
        //Настройка сегментов Enemy Picker
        enemyPicker.insertSegment(withTitle: "2 Players", at: 0, animated: true)
        enemyPicker.insertSegment(withTitle: "AI Player", at: 1, animated: true)
        enemyPicker.insertSegment(withTitle: "Bluetooth", at: 2, animated: true)
        
        enemyPicker.addTarget(self, action: #selector(enemyPickerDidChanged), for: .valueChanged)
        
        enemyPicker.setEnabled(false, forSegmentAt: 2)
        enemyPicker.selectedSegmentIndex = 0
        //
        
        //Настройка констрейнтов
        NSLayoutConstraint.activate([
        
            enemyPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            enemyPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            enemyPicker.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -60),
            enemyPicker.topAnchor.constraint(equalTo: enemyLabelsBlock.bottomAnchor, constant: 10),
            
            enemyLabelsBlock.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            enemyLabelsBlock.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            enemyLabelsBlock.heightAnchor.constraint(equalToConstant: 31),
        ])
        
        UIView.massiveTranslateAutoresizingMaskIntoConstraint([
        
            enemyLabelsBlock,
            enemyPicker,
        ])
    }
    
    //MARK: - Настройка блока с выбором сложности ПК
    
    func configurateSettingsBlock(){
        
        view.addSubview([
        
            computerDifficultLable,
            computerDifficultPicker,
        ])
        
        computerDifficultLable.text = "AI Difficult"
        computerDifficultLable.textAlignment = .center
        computerDifficultLable.isEnabled = false
        
        //Настройка сегментов computer Difficult Picker
        computerDifficultPicker.insertSegment(withTitle: "😇", at: 0, animated: true)
        computerDifficultPicker.insertSegment(withTitle: "😈", at: 1, animated: true)
        computerDifficultPicker.selectedSegmentIndex = 0
        
        computerDifficultPicker.isEnabled = false
        //
        
        //Настройка констрейнтов
        NSLayoutConstraint.activate([
            
            computerDifficultLable.topAnchor.constraint(equalTo: enemyPicker.bottomAnchor, constant: 20),
            computerDifficultLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            computerDifficultLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            computerDifficultPicker.topAnchor.constraint(equalTo: computerDifficultLable.bottomAnchor, constant: 10),
            computerDifficultPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            computerDifficultPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
        
        UIView.massiveTranslateAutoresizingMaskIntoConstraint([
        
            computerDifficultLable,
            computerDifficultPicker
        ])
    }
    
    //MARK: - Настройка кнопки старта
    
    func configurateButton(){
        
        view.addSubview([
        
            startButton
        ])
        
        startButton.backgroundColor = Colors.buttonColor1
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: startButton.titleLabel?.font.pointSize ?? 0)
        
        startButton.addTarget(self, action: #selector(tapOnStartButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            startButton.topAnchor.constraint(equalTo: computerDifficultPicker.bottomAnchor, constant: 30),
            startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            startButton.heightAnchor.constraint(equalTo: computerDifficultPicker.heightAnchor, multiplier: 2)
        ])
        
        UIView.massiveTranslateAutoresizingMaskIntoConstraint([
        
            startButton
        ])
    }
    
    //MARK: - Рекация на смену соперника
    
    @objc func enemyPickerDidChanged(){
        
        switch enemyPicker.selectedSegmentIndex {
        
        case 0:
            difficultHiddenState(state: false)
        case 1:
            difficultHiddenState(state: true)
        case 2:
            print("2")
        default:
            break
        }
    }
    
    //MARK: - Отключение выбора сложности компьютера при выборе другого режима
    
    func difficultHiddenState(state:Bool){
        
        computerDifficultLable.isEnabled = state
        computerDifficultPicker.isEnabled = state
    }
    
    //MARK: - Таргет для кнопки
    
    @objc func tapOnStartButton(){
        
        print("Button did touched")
        
        router.navigateToGameField()
    }
}
