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
    
    var people: [Person] = []
    
    private let kPerson = "Person"
    
    static let sharedController = PersonController()
    
    func add(person: Person) {
        self.people.append(person)
        UserDefaults.standard.set(person.dictionaryRep, forKey: kPerson)
    }
    
    func delete(person: Person) {
        UserDefaults.standard.removeObject(forKey: kPerson)
    }
    
    func loadFromPersistStore(){
        guard let people = UserDefaults.standard.object(forKey: kPerson) as? [[String: String]] else { return }
        self.people = people.flatMap { Person(dictionary: $0) }
    }
}


