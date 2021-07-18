//
//  GameFieldView.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 11.07.2021.
//

import UIKit
import SpriteKit
import GameplayKit

protocol GameFieldViewProtocol: AnyObject {
    
}

class GameFieldView: UIViewController,GameFieldViewProtocol {
    
    var interactor: GameFieldInteractorProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
    }
    
    deinit {
        print("\(self) was deinited!")
    }
}
