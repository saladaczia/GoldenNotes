//
//  NoteController.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit
import CoreData

class NoteController: UIViewController, UITextViewDelegate {

    // Outlets
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    // Coredata context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create placeholder for UITextView
        noteTextView.text = "Type description..."
        noteTextView.textColor = UIColor.gray
        noteTextView.delegate = self
    }
    
    // Function for reload table in previous view
    func refreshTable() {
        NotificationCenter.default.post(name: NSNotification.Name("ReloadTabeList"), object: nil)
    }
    
    // Save note to coredata function
    func saveNewNote() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    // Save button action
    @IBAction func savePressed(_ sender: Any) {
        // Add new and save note
        let newNote = Notes(context: context)
        if titleLabel.text != "" {
            newNote.titleNote = titleLabel.text
        } else {
            newNote.titleNote = "Untitled"
        }
        // optional description text if is empty
        if noteTextView.text == "Type description..." || noteTextView.text == "" {
            noteTextView.text = "No description"
        }
        newNote.textNote = noteTextView.text
        saveNewNote()
        
        // reload table in list Controller
        refreshTable()
        // Return to list view
        _ = navigationController?.popViewController(animated: true)
        
    }
    
   
}

// MARK: - TextView Placeholder
extension NoteController {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if noteTextView.textColor == UIColor.gray {
            noteTextView.text = nil
            noteTextView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if noteTextView.text.isEmpty {
            noteTextView.text = "Type description..."
            noteTextView.textColor = UIColor.gray
        }
    }
}
