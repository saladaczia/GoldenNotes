//
//  NoteController.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit

class NoteController: UIViewController, UITextViewDelegate {

    // Outlets
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create placeholder for UITextView
        noteTextView.text = "Type description..."
        noteTextView.textColor = UIColor.gray
        noteTextView.delegate = self
      
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
