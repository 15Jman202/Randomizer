//
//  Person.swift
//  Randomizer
//
//  Created by Justin Carver on 10/7/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {
    
    convenience init(name: String, context: NSManagedObjectContext = Stack.context) {
        
        self.init(context: context)
        
        self.name = name
    }
}
