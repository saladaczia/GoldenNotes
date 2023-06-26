//
//  ViewController.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit
import CoreData

class ListController: UIViewController {
    
    // Outlets
    @IBOutlet weak var noteListTable: UITableView!
    
    // Coredata context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // CoreData array
    var noteArray = [Notes]()
    
    
    // Selector for reloadTable
    @objc func reloadTableData() {
        loadNote()
        noteListTable.reloadData()
    }
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add observer for reloadTableData
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: NSNotification.Name("ReloadTabeList"), object: nil)
        
        // register table data source and delegate
        noteListTable.dataSource = self
        noteListTable.delegate = self
        
        // register table cell nib
        noteListTable.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: "noteCell")
        
        // Run load data
        loadNote()
    }
    
    
    
    // Create new note button action
    @IBAction func newNotePressed(_ sender: Any) {
        performSegue(withIdentifier: "goToNote", sender: self)
    }
    
}

// MARK: - TableView Extension
extension ListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteListTable.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        // Cell test labels
        cell.titleLabel.text = noteArray[indexPath.row].titleNote
        cell.descriptionLabel.text = noteArray[indexPath.row].textNote
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // segue to viewer
        performSegue(withIdentifier: "goToViewer", sender: self)
        // deselected row
        noteListTable.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
     {
         if editingStyle == .delete {
             // Delete the row from the coreData
             context.delete(noteArray[indexPath.row])
             // Delete the row from array
             noteArray.remove(at: indexPath.row)
             // Delete the row from the table
             noteListTable.deleteRows(at: [indexPath], with: .fade)
             saveNote()
         }
     }
}

// MARK: - extension segue prepare
extension ListController {
    // prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToViewer" {
            let vieverVC = segue.destination as! ViewerController
            if let indexPath = noteListTable.indexPathForSelectedRow {
                vieverVC.titleView = noteArray[indexPath.row].titleNote
                vieverVC.descriptionView = noteArray[indexPath.row].textNote
                print(indexPath.row)
            }
            
        }
    }
}

// MARK: - CoreData Functions
extension ListController {
    
    // Load CoreData and put to array function
    func loadNote() {
        let request: NSFetchRequest<Notes> = Notes.fetchRequest()
        do {
            noteArray = try context.fetch(request)
        } catch {
            print("Error")
        }
    }
    
    // Save note to coredata function
    func saveNote() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
}

