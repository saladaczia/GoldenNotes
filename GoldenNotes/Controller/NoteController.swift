//
//  NoteController.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit

class NoteController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create placeholder for UITextView
        noteTextView.text = "Placeholder"
        noteTextView.textColor = UIColor.lightGray
        noteTextView.delegate = self
      
    }
    
    
   
}

// MARK: - TextView Placeholder
extension NoteController {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if noteTextView.textColor == UIColor.lightGray {
            noteTextView.text = nil
            noteTextView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if noteTextView.text.isEmpty {
            noteTextView.text = "Placeholder"
            noteTextView.textColor = UIColor.lightGray
        }
    }
}
