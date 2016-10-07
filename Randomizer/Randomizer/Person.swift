//
//  Person.swift
//  Randomizer
//
//  Created by Justin Carver on 10/7/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation

class Person: Equatable {
    
    private let kName = "Name"
    
    var dictionaryRep: [String: String] {
        return [kName: name]
    }
    
    var name: String
    
    init?(dictionary: [String: String]) {
        guard let name = dictionary[kName] else { return nil }
        self.name = name
    }
    
    init(name: String) {
        self.name = name
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name
}
