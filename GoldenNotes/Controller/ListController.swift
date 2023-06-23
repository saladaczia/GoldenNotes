//
//  ViewController.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit

class ListController: UIViewController {

   
    // Outlets
    @IBOutlet weak var noteListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // register table data source and delegate
        noteListTable.dataSource = self
        noteListTable.delegate = self
        
        // register table cell nib
        noteListTable.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: "noteCell")
    }
    // Create new note button action
    @IBAction func newNotePressed(_ sender: Any) {
        performSegue(withIdentifier: "goToNote", sender: self)
    }
    
}

// MARK: - TableView Extension
extension ListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteListTable.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        // Cell test labels
        cell.titleLabel.text = "Title test"
        cell.descriptionLabel.text = "Description test"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNote", sender: self)
    }
    
    
}
