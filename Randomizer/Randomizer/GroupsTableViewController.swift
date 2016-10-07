//
//  GroupsTableViewController.swift
//  Randomizer
//
//  Created by Justin Carver on 10/7/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        displayAddPersonAlertController()
    }
    
    @IBAction func addButtonTapped() {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return PersonController.sharedController.People.count / 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = PersonController.sharedController.People[indexPath.row]
        
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    func displayAddPersonAlertController() {
        let alertController = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (_) in
            guard let text = alertController.textFields?.first?.text, text != "" else { return }
            let person = Person(name: text)
            PersonController.sharedController.add(person: person)
            self.tableView.reloadData()
        }
        
        alertController.addAction(doneAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
