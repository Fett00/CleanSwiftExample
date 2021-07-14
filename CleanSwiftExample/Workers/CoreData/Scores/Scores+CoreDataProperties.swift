//
//  Scores+CoreDataProperties.swift
//  CleanSwiftExample
//
//  Created by Садык Мусаев on 14.07.2021.
//
//

import Foundation
import CoreData


extension Scores {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scores> {
        return NSFetchRequest<Scores>(entityName: "Scores")
    }

    @NSManaged public var leftScore: Int32
    @NSManaged public var rightScore: Int32
    @NSManaged public var timeStamp: Double

}

extension Scores : Identifiable {

}
