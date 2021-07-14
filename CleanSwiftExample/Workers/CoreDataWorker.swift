//
//  ScoreDataWorker.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 14.07.2021.
//

import UIKit
import CoreData

class CoreDataWorker<Entity: NSManagedObject>{
    
    //Создание контекста для работы с CoreData
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Сохранение Данных в БД
    private func save(){
        do {
            try self.context.save()
        }
        catch  {fatalError("Can not save in CoreData!")}
    }
    
    //Добавление записи в CoreData
    func add(createObject: ()->()) {
        
        createObject()
        save()
    }
    
    //Удаление записи из CoreData
    func delete(){
        
        //context.delete()
        save()
    }
    
    //Обновление записей в CoreData
    func refresh() {
        
    }
    
    
    //TODO: Добавить запрос к БД с условиями(для поиска)
    //Получение записей из CoreData
    
    func get(withCondition condition:String?,withLimit limit:Int?) -> [Entity] {

        var predicate:NSPredicate?
        
        if let condition = condition{
            predicate = NSPredicate(format: condition)
        }

        do {
            
            let request = Entity.fetchRequest()
            request.predicate = predicate
            request.fetchLimit = limit ?? 0
            
            let tempData:[Entity] = try context.fetch(request) as! [Entity]
            return tempData
        }
        catch {
            return []
        }
    }
}
