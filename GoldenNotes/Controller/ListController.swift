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
        // register table data source
        noteListTable.dataSource = self
        // register table cell nib
        noteListTable.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: "noteCell")
    }


}

// MARK: - TableView Extension
extension ListController: UITableViewDataSource {
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
    
    
}
