//
//  GroupsTableViewController.swift
//  Randomizer
//
//  Created by Justin Carver on 10/7/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit
import GameKit

class GroupsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonController.sharedController.loadFromPersistStore()
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        displayAddPersonAlertController()
    }
    
    @IBAction func randomizeButtonTapped() {
        guard let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: PersonController.sharedController.people) as? [Person] else { return }
        PersonController.sharedController.people = shuffledArray
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if PersonController.sharedController.people.count % 2 != 0 {
            return "Unasigned"
        } else {
            return "Team \(section + 1)"
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        let count = PersonController.sharedController.people.count
        
        if count % 2 == 0 {
            return PersonController.sharedController.people.count / 2
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let index = (indexPath.section * 2) + indexPath.row
        let person = PersonController.sharedController.people[index]
        
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    func displayAddPersonAlertController() {
        let alertController = UIAlertController(title: "Add a Team", message: "Add a two person team", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "1st team member name"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "2nd team member name"
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (_) in
            guard let text = alertController.textFields?.first?.text, text != "", let text2 = alertController.textFields?.last?.text, text2 != "" else { return }
            let person1 = Person(name: text)
            let person2 = Person(name: text2)
            PersonController.sharedController.add(person: person1)
            PersonController.sharedController.add(person: person2)
            self.tableView.reloadData()
        }
        
        alertController.addAction(doneAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
