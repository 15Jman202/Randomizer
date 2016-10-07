//
//  People Controller.swift
//  Randomizer
//
//  Created by Justin Carver on 10/7/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation
import CoreData

class PersonController {
    
    static let sharedController = PersonController()
    
    var People: [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    func add(person: Person) {
        saveToCore()
    }
    
    func delete(person: Person) {
        person.managedObjectContext?.delete(person)
        saveToCore()
    }
    
    func saveToCore() {
        do {
            try Stack.context.save()
        } catch {
            return
        }
    }
}
