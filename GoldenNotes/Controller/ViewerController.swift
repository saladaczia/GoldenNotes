//
//  ViewerController.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit

class ViewerController: UIViewController {

    // data from ListController
    var titleView: String?
    var descriptionView: String?
    
    // Outlets
    @IBOutlet weak var titleViewLabel: UILabel!
    @IBOutlet weak var descriptionViewLabel: UITextView!
    
    // ViewDidLoad
    override func viewDidLoad() {

        super.viewDidLoad()
        // Set title and description
        titleViewLabel.text = titleView
        descriptionViewLabel.text = descriptionView

    }
    

}
